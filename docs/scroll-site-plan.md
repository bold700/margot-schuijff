# Margot Schuijff — Scroll-site content plan

Bewerkte versie van `schuijff-recruitment-sitemap-wireframes.md`, aangepast
aan de bestaande architectuur. Wij bouwen **één scroll-site** met crossfadende
hoofdstukken in een pinned stage, geen multi-page bureausite. De wireframes
hieronder zijn dus per hoofdstuk, niet per pagina.

---

## Uitgangspunten (zelfde als origineel)

- Persoonlijk expertmerk, niet corporate bureau.
- Margot is de zichtbare hoofdpersoon: haar gezicht, mening en directe stijl.
- Niet zo positioneren: *"Wij zijn een recruitmentbureau."*
- Wel: *"Ik ben Margot. Ik snap mensen, business en timing. Bel mij als de match
  echt moet kloppen."*
- Haar voordeel is geen schaal, maar aandacht, scherpte, eerlijkheid en
  zorgvuldigheid.

---

## Vertaling sitemap → scroll-stage

| Origineel (pagina) | Scroll-site (hoofdstuk) |
|--------------------|--------------------------|
| Home — hero + herkenning | **00 Hero** + **01 Je belt mij als** |
| Voor bedrijven | **02 Voor bedrijven (probleem)** + **03 Diensten** |
| Werkwijze (5 stappen) | **04 Werkwijze** (5 stappen compact in één stage) |
| Voor kandidaten | **05 Voor kandidaten** |
| Over Margot | **06 Portret + intro** + **07 Pull-quote + interim** |
| Ervaringen | **08 Referenties** (carousel op mobiel) |
| Contact | **09 Slot CTA** + footer |

Tien hoofdstukken, gelijk aan de huidige stage. Twee dingen veranderen
substantieel ten opzichte van de huidige site:

1. Het accent verschuift van "diensten" (recruitment/advies-trio) naar
   "**Margot als persoonlijke partner**" met expliciete tracks voor
   *bedrijven* én *kandidaten*.
2. De huidige drie advies-hoofdstukken (instroom, HR-advies, transitie)
   worden vervangen door een **werkwijze in 5 stappen** in één hoofdstuk,
   en een apart kandidatenblok.

---

## Hoofdstuk-voor-hoofdstuk

Layout-codes verwijzen naar de bestaande klassen in `styles.css`.

---

### 00 — Hero

**Layout** `cap--hero cap--dark`, video-achtergrond (`ch00-hero.mp4`),
links uitgelijnd, donkere overlay, witte typografie.

**Eyebrow** `Recruitment & HR · persoonlijke partner`

**Display (h1, Fraunces serif, italic op laatste regel)**

> Recruitment begint niet bij zoeken.
> *Het begint bij begrijpen.*

**Lede**

> Ik help bedrijven scherp krijgen wie past bij hun organisatie, hun fase en
> hun ambitie. Daarna zoek, selecteer en begeleid ik zorgvuldig.

**Primaire CTA** `Plan een kennismaking` → `mailto:`
**Secundaire CTA** `Bekijk mijn werkwijze` → `#werkwijze`

**Scroll-hint** linksonder

---

### 01 — Je belt mij als

**Layout** `cap--right cap--dark`, video-achtergrond (`ch01-kern.mp4`),
ghost-word "**mensen**" centraal achter de card.

**Kicker** `De kern`

**Titel** `Je belt mij als...`

**Body (lijst, kort gehouden)**

- een belangrijke rol moet worden ingevuld
- je geen standaard recruiter zoekt
- je twijfelt of het profiel klopt
- je iemand nodig hebt die met directie en management kan schakelen
- je liever 3 goede kandidaten spreekt dan 20 halve matches

> Vervangt het huidige "Mensen maken een organisatie"-blok. Tone-of-voice
> blijft hetzelfde, maar de boodschap is nu actiever: deze regels triggeren
> directe herkenning bij de lezer.

---

### 02 — Voor bedrijven, het probleem

**Layout** `cap--left cap--dark`, video-achtergrond (`ch02-recruitment.mp4`),
ghost-word "**begrijpen**".

**Kicker** `Voor bedrijven`

**Titel** `Goede werving begint bij begrijpen.`

**Body**

> Recruitment gaat vaak mis voordat de zoektocht begint. Het profiel is te
> algemeen, intern zoekt iedereen iets anders, de vacature verkoopt de rol
> niet en kandidaten haken af door onduidelijkheid.

> Behoudt de bestaande verbatim Margot-zin als titel; de body komt uit de
> "Probleem"-lijst van het origineel, samengevat tot vloeiende tekst.

---

### 03 — Wat ik doe

**Layout** `cap--right cap--dark`, video-achtergrond (`ch03-instroom.mp4`),
ghost-word "**aandacht**".

**Kicker** `Mijn diensten`

**Titel** `Aandacht, niet schaal.`

**Body — 3 diensten compact onder elkaar**

- **Recruitmentadvies.** Voor als je eerst scherpte nodig hebt.
- **Werving & selectie.** Voor als je gericht zoekt naar de juiste persoon.
- **Senior of specialistische search.** Voor rollen waar ervaring, vertrouwen
  en timing belangrijk zijn.

> Vervangt het huidige "Instroom, doorstroom en uitstroom" blok. De drie
> dienstregels zijn equivalent aan de drie advies-thema's, maar nu in
> bedrijfstaal en met de "geen schaal, wel aandacht"-positionering.

---

### 04 — Werkwijze in 5 stappen

**Layout** `cap--left cap--dark`, video-achtergrond (`ch04-richting.mp4`),
ghost-word "**stappen**", id="werkwijze".

**Kicker** `Mijn werkwijze`

**Titel** `Persoonlijk, scherp, zorgvuldig.`

**Body — 5 stappen als genummerde lijst**

1. **Kennismaken.** We bespreken de rol, organisatie en de vraag achter de vraag.
2. **Scherpstellen.** We maken het profiel concreet, niet alleen wat iemand
   moet kunnen maar ook wie past.
3. **Markt benaderen.** Ik benader mensen persoonlijk en gericht, geen
   massale aanpak.
4. **Selecteren.** Je krijgt geen stapel cv's, maar kandidaten met context.
5. **Begeleiden.** Ik blijf betrokken tijdens gesprekken, terugkoppeling,
   keuze en afronding.

> Op desktop kunnen de 5 stappen in een 2- of 3-koloms grid binnen de card
> staan. Op mobiel onder elkaar. Compacte typografie zodat alles in één
> viewport past.

---

### 05 — Voor kandidaten

**Layout** `cap--right cap--dark`, video-achtergrond (`ch05-transitie.mp4`),
ghost-word "**eerlijk**".

**Kicker** `Voor professionals`

**Titel** `Een volgende stap moet kloppen. Niet alleen op papier.`

**Body**

> Ik help professionals nadenken over rollen die passen bij hun ervaring,
> energie en ambitie. Geen snelle match, maar een eerlijk gesprek, scherpe
> vragen en zorgvuldige begeleiding richting de juiste keuze.

> Vervangt het huidige "Onafhankelijke gesprekken bij transitie"-blok. Past
> beter bij de tweezijdige positionering die het origineel voorstelt.

---

### 06 — Over Margot, intro

**Layout** `cap--panel cap--light`, **lichte cream wash** (terug uit de
donkere serie), portret-arch links, tekst rechts. Géén video.

**Portret** `media/margot.jpg` in arch-vorm.

**Kicker** `Over Margot Schuijff`

**Titel** `Inhoudelijke scherpte, met menselijkheid en rust.`

**Body (bio paragraaf 1, verbatim van haar testpage)**

> Recruitment en HR zijn voor mij twee kanten van hetzelfde vak. Het gaat
> over mensen verbinden aan organisaties en organisaties helpen die
> verbinding goed te onderhouden. In mijn werk combineer ik inhoudelijke
> scherpte met menselijkheid en rust. Ik werk graag met HR-teams en
> leidinggevenden die werving en behoud willen verbinden met strategie en
> cultuur.

> Behoudt de huidige opzet en haar verbatim bio. De pagina "Over Margot"
> uit het origineel wordt opgeknipt in twee crossfadende hoofdstukken (06
> en 07) waarbij het portret visueel blijft staan en alleen de tekst
> verandert.

---

### 07 — Over Margot, vervolg

**Layout** zelfde als 06 (`cap--panel cap--light`), zelfde portret op
dezelfde plek, zelfde wash. Alleen de tekst wisselt.

**Kicker** `Over Margot · vervolg`

**Pull-quote (italic Fraunces, terracotta)**

> "Niet in perfectie, maar in voortgang die klopt, voor zowel de organisatie
> als de mens."

**Body (bio paragraaf 2, verbatim)**

> Daarnaast ben ik inzetbaar als interim recruitmentmanager of projectleider
> bij organisaties die verandering willen vormgeven of versnellen. Of het nu
> gaat om het bouwen van een afdeling, het verbeteren van processen of het
> vergroten van bewustzijn rond generaties en samenwerking, ik help om
> ideeën om te zetten in resultaat.

---

### 08 — Referenties

**Layout** `cap--panel cap--light`, warme paper-wash, header + carousel.

**Desktop** drie quote-cards in een grid.

**Mobiel** scroll-jack carousel: cap wordt 320vh hoog, header sticky, kaarten
schuiven horizontaal mee met verticale scroll. Progress-balkje onderaan.

**Kicker** `Referenties`

**Titel** `Wat opdrachtgevers en kandidaten zeggen.`

**Quote-cards (verbatim, zoals nu):**
1. Wessel van Enk (ServiceNow MVP) — "Open, vriendelijk en duidelijk"
2. Diederik Vosmer (Manager Recruitment ANWB) — "Een aanwinst voor elk team"
3. Marie-José Schoonens (Sr. Adviseur Communicatie) — "Onmisbare partner in ons wervingsproces"

> Het origineel stelt voor om uitgewerkte cases (situatie/uitdaging/aanpak/
> resultaat) toe te voegen. Voor nu houden we het op de drie bestaande
> testimonials. Cases kunnen later in een uitklap-element of als extra
> hoofdstuk worden toegevoegd zodra Margot er heeft om te delen.

---

### 09 — Slot CTA

**Layout** `cap--closer cap--dark`, video-achtergrond (`ch08-slot.mp4`),
gecentreerd.

**Eyebrow** `Sterk in het gesprek`

**Pull-line (Fraunces serif, italic accent op slot)**

> Ik stel vragen die raken, luister tussen de regels door en breng beweging
> waar het *vastzit*.

**Primaire CTA** `Plan een kennismaking` → `mailto:contact@margotschuijff.nl`

> Behoudt de huidige verbatim slot-tekst. De "Contact"-pagina uit het
> origineel collapsed naar deze hero-CTA plus de footer; we hebben geen
> apart contactformulier nodig in een one-pager.

---

## Footer (buiten de stage, in normale flow)

| Sectie | Inhoud |
|--------|--------|
| Brand | A/B-monogram (wit), tagline |
| Wat ik doe | `#voor-bedrijven`, `#werkwijze`, `#voor-kandidaten`, `#over`, `#referenties` |
| Contact | E-mail, LinkedIn-link |
| Bottom-bar | `Margot Schuijff · Recruitment & Advies · © 2026` + terug-naar-boven |

---

## Dock-navigatie

Vijf items, geen Ervaringen apart (zit als hoofdstuk in de scroll):

```
Voor bedrijven   →  #voor-bedrijven   (chapter 02)
Werkwijze        →  #werkwijze        (chapter 04)
Voor kandidaten  →  #voor-kandidaten  (chapter 05)
Over             →  #over             (chapter 06)
Referenties      →  #referenties      (chapter 08)
```

CTA-knop in de dock: `Laten we kennismaken` (mailto).

---

## Tone of voice (uit origineel, ongewijzigd)

**Wel**

> Ik help bedrijven beter kijken voordat ze iemand aannemen.

**Niet**

> Wij bieden hoogwaardige recruitmentoplossingen voor organisaties binnen
> diverse sectoren.

**Wel**

> Je zoekt niet zomaar iemand. Je zoekt iemand die past bij je bedrijf, je
> fase en de mensen aan tafel.

**Niet**

> Wij verbinden organisaties met toptalent door middel van maatwerk
> recruitmentoplossingen.

---

## Kernboodschap

> Margot helpt bedrijven de juiste mensen vinden voor rollen waar een
> verkeerde keuze te veel kost.

Persoonlijker:

> Ik help je scherp krijgen wie je echt nodig hebt en begeleid je naar de
> juiste match.

---

## Wat er technisch verandert in de site

Vergeleken met de huidige tien hoofdstukken:

- **Hero (00)**: copy vervangen door persoonlijke kop, video + layout blijft.
- **Kern (01)**: van "Mensen maken een organisatie"-paragraaf → "Je belt mij
  als..."-lijst. Ghost-word blijft `mensen`.
- **Recruitment (02)**: titel `Goede werving begint bij begrijpen` blijft;
  body wordt langer (probleem-blok). Ghost-word `begrijpen`.
- **Advies-trio (03/04/05)**: wordt **Diensten (03)** + **Werkwijze 5-stappen
  (04)** + **Voor kandidaten (05)**. Drie video's blijven gekoppeld; copy en
  ghost-words wijzigen.
- **Over Margot (06/07)**: ongewijzigd; portret-reuse blijft het ankerpunt.
- **Referenties (08)**: ongewijzigd; scroll-jack carousel op mobiel blijft.
- **Slot (09)**: ongewijzigd.
- **Footer**: navigatie- en contactlinks updaten naar nieuwe ids.

Geen extra paginabouw, geen routing, geen contact-formulier nodig. Alles
blijft één HTML-bestand met dezelfde architectuur.

---

## Advies (uit origineel, blijft staan)

Bouw deze site niet als bureauwebsite. Bouw hem als persoonlijk expertmerk.
Margot moet zichtbaar zijn. Haar gezicht, haar mening, haar manier van werken
en haar directe stijl zijn de reden dat mensen contact opnemen.
