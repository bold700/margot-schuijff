# Margot Schuijff — scroll website

Een scrollytelling-website voor Margot Schuijff, strategisch partner in recruitment en HR.
Gebouwd in dezelfde stijl als de bakkerij-scroll-site: één vastgepinde "stage" met
hoofdstukken die in elkaar overvloeien, hier gedreven door kleurwasovergangen in plaats
van video. Warme editorial-uitstraling, crème naar diep espresso.

## Draaien

Statische site, geen build. Serveer de map en open in de browser:

```
cd ~/Documents/GitHub/margot-schuijff
python3 -m http.server 8095
```

Dan: http://localhost:8095

## Opbouw

| Bestand | Inhoud |
|---------|--------|
| `index.html` | Structuur en alle teksten |
| `styles.css` | Warme editorial tokens, stage, secties, responsive |
| `app.js` | Lenis smooth scroll, stage-crossfade, parallax, reveals |
| `media/ch00-hero.mp4` t/m `ch08-slot.mp4` | Achtergrondvideo per hoofdstuk (zeven clips, gecomprimeerd naar 1280px, samen ±1.7 MB). Bij elke `.mp4` hoort een `.jpg` poster die als fallback achtergrond dient. |
| `media/margot.jpg` | Portretfoto voor het Over Margot-hoofdstuk |
| `media/logo.png` | Het A/B-monogram, gebruikt in header, footer en als favicon |

De scroll-stage telt **10 hoofdstukken**, allemaal met het crossfade-effect:
hero, de kern, recruitment, drie advies-thema's, Over Margot (portret + intro),
Over Margot vervolg (pull-quote + interim), Referenties en de slot-CTA. Alleen
de footer staat in normale flow daaronder.

Alle teksten zijn **verbatim van margotschuijff.nl/testpage** overgenomen: de
koppen, de zinnen per dienst, de bio, de referenties en de slottekst. Er is geen
copy bijgeschreven.

## Nog in te vullen

**E-mailadres** — overal staat `contact@margotschuijff.nl` als tijdelijk adres
(zoekopdracht: `contact@margotschuijff.nl`). Vervang door Margots echte adres.

## Toegankelijkheid & responsive

- **Desktop**: vastgepinde stage, 9 crossfadende hoofdstukken.
- **Smal scherm (≤700px)** en **`prefers-reduced-motion`**: de stage wordt
  ontpind en alle hoofdstukken staan gewoon onder elkaar, met dezelfde kleuren.
  Niets verdwijnt.
- Skip-link, zichtbare focus-states, semantische HTML, 46px touch targets.
