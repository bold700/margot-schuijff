/* =================================================================
   Margot Schuijff — analytics & conversion tracking
   -----------------------------------------------------------------
   1) Configureer hieronder je GA4 measurement ID en Google Ads ID.
   2) Zolang de ID's nog op 'G-XXXXXXXXXX' / 'AW-XXXXXXXXXX' staan,
      doet dit script niets (geen requests, geen cookies).
   3) Zodra de echte ID's ingevuld zijn:
      - GA4 page_view fire automatisch
      - mailto: en tel: klikken sturen 'generate_lead' event
      - bedankt.html stuurt de Ads conversion event
   ================================================================= */

(function () {
  // ---- CONFIG ----------------------------------------------------
  const GA4_MEASUREMENT_ID  = 'G-XXXXXXXXXX';   // bv. G-1A2B3C4D5E
  const ADS_CONVERSION_ID   = 'AW-XXXXXXXXXX';  // bv. AW-1234567890
  const ADS_CONVERSION_LABEL = 'XXXXXXXXX';     // bv. abc123XYZ (uit Google Ads conversion)
  // ----------------------------------------------------------------

  const isPlaceholder = (id) => /X{6,}/.test(id);
  if (isPlaceholder(GA4_MEASUREMENT_ID) && isPlaceholder(ADS_CONVERSION_ID)) {
    // Niets geconfigureerd — script is no-op tot je een ID invult.
    console.info('[analytics] inert: vul GA4_MEASUREMENT_ID / ADS_CONVERSION_ID in analytics.js');
    return;
  }

  // ---- Load gtag.js ----------------------------------------------
  const idToLoad = !isPlaceholder(GA4_MEASUREMENT_ID) ? GA4_MEASUREMENT_ID : ADS_CONVERSION_ID;
  const s = document.createElement('script');
  s.async = true;
  s.src = 'https://www.googletagmanager.com/gtag/js?id=' + idToLoad;
  document.head.appendChild(s);

  window.dataLayer = window.dataLayer || [];
  window.gtag = window.gtag || function () { window.dataLayer.push(arguments); };
  gtag('js', new Date());

  if (!isPlaceholder(GA4_MEASUREMENT_ID)) {
    gtag('config', GA4_MEASUREMENT_ID, { anonymize_ip: true });
  }
  if (!isPlaceholder(ADS_CONVERSION_ID)) {
    gtag('config', ADS_CONVERSION_ID);
  }

  // ---- Conversion helpers ----------------------------------------
  function trackLead(method, value) {
    // GA4 event
    if (!isPlaceholder(GA4_MEASUREMENT_ID)) {
      gtag('event', 'generate_lead', {
        method: method,
        value: value || 1,
        currency: 'EUR'
      });
    }
    // Google Ads conversion
    if (!isPlaceholder(ADS_CONVERSION_ID) && !isPlaceholder(ADS_CONVERSION_LABEL)) {
      gtag('event', 'conversion', {
        send_to: ADS_CONVERSION_ID + '/' + ADS_CONVERSION_LABEL,
        value: value || 1,
        currency: 'EUR'
      });
    }
  }

  // ---- mailto: en tel: click tracker -----------------------------
  document.addEventListener('click', function (e) {
    const a = e.target.closest && e.target.closest('a[href]');
    if (!a) return;
    const href = a.getAttribute('href') || '';
    if (href.startsWith('mailto:')) {
      trackLead('email', 1);
    } else if (href.startsWith('tel:')) {
      trackLead('phone', 1);
    }
  }, { capture: true });

  // ---- bedankt-pagina = formulier conversie ----------------------
  const p = location.pathname.replace(/\/$/, '');
  if (p === '/bedankt' || p === '/bedankt.html') {
    trackLead('form', 5);  // hogere value voor afgeronde form-conversie
  }

  // expose for debugging
  window.__analytics = { trackLead, GA4_MEASUREMENT_ID, ADS_CONVERSION_ID };
})();
