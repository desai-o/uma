# ఉమा (Uma) — Period Tracker

> _"a celebration of her body"_

A self-contained, privacy-first period tracker built as a single HTML file. No accounts, no servers, no tracking — just your browser and your data.

---

## What is this?

Uma is a period tracker that treats the menstrual cycle as what it is: **fascinating, beautiful biology**. Every day comes with a scientifically accurate biology fact about what your body is actually doing — written with wonder, not shame.

**The vibe:** Like a beautifully illustrated biology textbook fell in love with your body and decided to be kind about it.

---

## How to use

1. Open `uma.html` in any modern browser.
2. On first visit, you'll see a welcome screen. Enter the date your last period started, then tap **Get Started**.
3. Navigate between three views:
   - **☀ Today** — current cycle day, phase, a biology fact, and a period toggle
   - **☵ Calendar** — a full monthly calendar with logged and predicted period days
   - **⚙ Settings** — adjust cycle length, period length, or reset all data
4. **Click** the title `ఉమా` to open the **Listen / Watch** panel — Spotify lo-fi playlists or a curated movie watchlist

All data is stored in your browser's `localStorage`. Nothing is sent anywhere.

---

## Features

### Today View
- Cycle day counter ("Day 14") with current phase label (Menstrual / Follicular / Ovulation / Luteal)
- Period toggle — tap to mark the first day of a new cycle
- Predicted next period date and days until it arrives
- Daily biology fact card with a hand-drawn SVG illustration of what your body is doing right now

### Calendar View
- Month-by-month calendar with navigation
- Logged period days highlighted
- Predicted future period days with dashed borders
- Phase track bar at the top showing all four cycle phases
- Today's date marked distinctly

### Settings
- Adjustable cycle length (21–40 days, default 28)
- Adjustable period length (1–10 days, default 5)
- Reset all data (with confirmation dialog)

### Onboarding
- First-visit welcome screen with privacy note
- Date picker to set last period start date

### Listen / Watch Panel
- **Click the title** `ఉమా` to reveal a pill menu: `Listen` and `Watch`
- **Listen** — embedded Spotify player with Spotify's official *Lo-Fi Beats* playlist, playable in-page. Works on both free and premium Spotify accounts
- **Watch** — a curated movie watchlist of eight films. Tap any movie to check it off; the title gets struck through and the checkbox fills with the accent red. Great for quiet evenings during heavy days
- Panel closes via the ✕ button, the backdrop, or the `Escape` key

> **Note:** The Spotify embed requires the page to be served over HTTPS or `localhost`. If opening directly via `file://`, some browsers may block the iframe. Serve locally with `python -m http.server 8000` and open `http://localhost:8000/uma.html` for best results.

---

## Technical details

### File structure

```
uma/
├── uma.html      # The entire app (self-contained)
├── uma_v1_fixed.html  # Reference prototype
├── README.md     # This file
└── roadmap.md    # Build notes and design decisions
```

### No build step required

`uma.html` is a single, self-contained file. Open it directly in a browser — no server, no dependencies, no installation.

**External resources only:**
- System serif fonts (Georgia, Times New Roman) — no external font CDN required

### Data model

Data lives in `localStorage` under the key `"uma_data"`:

```json
{
  "last_period_start": "2026-08-01",
  "cycle_length": 28,
  "period_length": 5,
  "has_seen_welcome": true,
  "movies": { "1": true, "3": true, "8": true }
}
```

The `movies` object stores checked-off movie IDs — keys map to `true` when checked, removed when unchecked. All other fields are preserved across data resets.

### Cycle day calculation

```
cycleDay = (today - last_period_start) + 1

Phase thresholds:
  Days  1–5  → Menstrual
  Days  6–13 → Follicular
  Days 14–15 → Ovulation
  Days 16–28 → Luteal (wraps at 28 for display)
```

### Theme / color palette

| Token | Hex | Purpose |
|-------|-----|---------|
| `--bg` | `#eee7d8` | Page background (warm cream) |
| `--bg2` | `#f7f1e6` | Card / elevated surfaces |
| `--text` | `#29251f` | Primary text (dark ink) |
| `--muted` | `#857b6b` | Secondary / label text |
| `--line` | `#cfc4b2` | Borders and dividers |
| `--red` | `#984b46` | Accent — active states, CTAs |
| `--red2` | `#b7665d` | Accent hover state |
| `--period-bg` | `#e7dfcf` | Period day background |

The design aims for a **warm naturalist aesthetic** — cream parchment, earthy warmth, organic typography. Premium but never clinical.

---

## Key design decisions

- **Single file** — everything in one HTML document for maximum portability and offline use
- **localStorage only** — zero network requests for user data; completely offline-capable
- **28 phase-accurate biology facts** — one per cycle day, scientifically grounded, written in a warm celebratory voice
- **Four hand-drawn SVG diagrams** — one per phase, rendered in the fact card
- **Ambient media panel** — click the title to enter Listen (Spotify) or Watch (movie watchlist) mode; supports the wellness and educational dimension of the experience
- **Responsive mobile-first** — designed for a 375px+ viewport, max-width container at 480px
- **No framework** — vanilla JS and CSS; the entire app is ~2,180 lines

---

## Browser support

Tested on modern evergreen browsers:
- Chrome / Chromium
- Firefox
- Safari
- Edge

Requires `localStorage` and CSS custom properties (all supported in any browser from 2017 onward).