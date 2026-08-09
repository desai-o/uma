# Uma | Uma Period Tracker

**"a celebration of her body"**

---

## Concept

Uma is a period tracker that treats the menstrual cycle as what it is: **fascinating, beautiful biology**. Styled like a naturalist notebook crossed with a love letter to the female body — warm, scientific, and deeply respectful.

**The Vibe:** Like a beautifully illustrated NCERT biology textbook fell in love with your body and decided to be kind about it.

---

## Core Philosophy

- **Warm Naturalist Aesthetic** — Cream parchment backgrounds, hand-drawn feel, earthy warmth
- **Biomedical Accuracy** — 28 daily facts, one per cycle day; scientifically accurate with wonder
- **Celebratory, Not Apologetic** — "Your body is doing mammalian biology!" — empowering, never shame-inducing

---

## Build Guide

Follow these steps in order to build Uma from scratch. Each section builds upon the previous one.

---

## Step 1: Project Setup

### Create the HTML file
- [x] Create a single self-contained file: `uma.html`
- [x] Include `<!DOCTYPE html>`, `<html>`, `<head>`, and `<body>` structure
- [x] Set `<meta charset="UTF-8">` and `<meta name="viewport" content="width=device-width, initial-scale=1.0">`
- [x] Set `<title>ఉమా | Uma's Period Tracker</title>`

### Add Google Fonts
- [x] Import Crimson Text (for headings, serif)
- [x] Import Inter (for body text, sans-serif)

---

## Step 2: CSS Foundation & Theme

### Set up CSS variables at the root:
```css
:root {
  --bg: #faf7f2;
  --text: #2d4a3e;
  --accent-rose: #c9a9a6;
  --accent-amber: #d4a574;
  --period-bg: #e8c4c4;
  --border: #d4c5b9;
}
```

### Global styles:
- [x] Set `body` background to `var(--bg)`
- [x] Set `body` color to `var(--text)`
- [x] Set `body` font-family to Inter
- [x] Set `h1, h2, h3` font-family to Crimson Text
- [x] Remove default margins and padding
- [x] Add box-sizing: border-box

---

## Step 3: Data Model & LocalStorage

### Define the data structure:
```
User Profile (stored in localStorage):
  - cycle_length: number (default 28)
  - period_length: number (default 5)
  - last_period_start: ISO date string or null
  - has_seen_welcome: boolean
```

### Implement storage functions:
- [x] `saveData()` — saves state object to localStorage as JSON
- [x] `loadData()` — loads state from localStorage, returns defaults if empty
- [x] `resetData()` — clears all data and shows welcome screen

### Initialize app state:
- [x] Load data on page load
- [ ] If first visit (no data), show welcome screen (Step 4)
- [ ] Otherwise, show main tracker view (Step 5+)

---

## Step 4: Welcome Screen (First Visit)

### Create welcome screen container:
- [x] Full-screen overlay with semi-transparent background
- [x] Centered card with warm styling
- [x] Beautiful welcome message in Crimson Text
- [x] Tagline: "a celebration of her body"

### Welcome content:
- [x] Title: "Welcome to Uma"
- [x] Brief description of the app's purpose
- [x] Note about privacy (localStorage only, no server)
- [x] Single "Get Started" button

### Welcome behavior:
- [x] On button click, set `last_period_start` to today
- [x] Mark `has_seen_welcome: true`
- [x] Save to localStorage
- [x] Fade out welcome screen
- [ ] Show main tracker view (Step 5+)

---

## Step 5: Main Layout Structure

### Header section:
- [x] App name "ఉమా" in large Crimson Text
- [x] Subtitle "Uma's Period Tracker" in smaller text
- [x] Settings gear icon (top right corner)

### Main content area (three main views):
1. **Today View** — Cycle day tracker + biology fact card
2. **Calendar View** — Monthly calendar with period tracking
3. **Settings View** — Configuration options

### Navigation:
- [x] Tab buttons or simple section toggle
- [x] "Today", "Calendar", "Settings" labels
- [x] Active state styling with accent color

---

## Step 6: Today View — Cycle Day Tracker

### Cycle information display:
- [x] Calculate current cycle day based on `last_period_start`
- [x] Display: "Day X of your cycle" in large text
- [x] Determine current phase name:
  - Days 1-5: Menstrual
  - Days 6-13: Follicular
  - Days 14-15: Ovulation
  - Days 16-28+: Luteal
- [x] Display phase name with descriptive text

### Period logging:
- [x] Large "Period" toggle button
- [x] States: "Start Period" / "Period Active"
- [x] When starting period: update `last_period_start` to today
- [x] Visual feedback on toggle (color change)

### Next period prediction:
- [x] Calculate next period date: `last_period_start + cycle_length`
- [x] Display: "Next period expected: [date]"
- [x] Show days until next period

---

## Step 7: Today View — Biology Fact Card

### Create the fact card component:
- [x] Styled card with warm background
- [x] Slight shadow for depth
- [x] Rounded corners (12px)
- [x] Padding for content
- [x] Gradient header with rose-to-amber

### Create 28 facts array (one per cycle day):

**Menstrual Phase (Days 1-5):**
- [x] Day 1: Menstruation begins, endometrium shedding
- [x] Day 2: Prostaglandins cause uterine contractions
- [x] Day 3: Blood flow at peak, iron loss awareness
- [x] Day 4: Flow beginning to slow, uterus healing
- [x] Day 5: End of bleeding, follicle preparation begins

**Follicular Phase (Days 6-13):**
- [x] Day 6-7: Pituitary releases FSH, awakening ovaries
- [x] Day 8-9: Estrogen begins rising, endometrium rebuilds
- [x] Day 10-12: Dominant follicle selected, estrogen peaks
- [x] Day 13: Cervix softening, fertile window opens

**Ovulation Phase (Days 14-15):**
- [x] Day 14: LH surge triggers ovulation, egg released
- [x] Day 15: Egg travels through fallopian tube

**Luteal Phase (Days 16-28):**
- [x] Day 16-19: Corpus luteum forms, progesterone rises
- [x] Day 20-24: Progesterone at peak, endometrium matures
- [x] Day 25-28: If no implantation, corpus luteum degrades, progesterone drops

### Display logic:
- [x] Look up fact based on current cycle day
- [x] Display phase-appropriate fact
- [x] Use warm, celebratory language
- [x] Include scientific accuracy with wonder

---

## Step 8: SVG Diagrams (4 Phase Illustrations)

Create 4 labeled SVG diagrams, one for each phase. Each should be a uterus cross-section in a hand-drawn/naturalist style.

### Menstrual Diagram (Days 1-5):
- [x] Uterus cross-section outline
- [x] Thin endometrium (being shed)
- [x] Small annotations: "endometrium shedding", "blood flow"
- [x] Color: muted reds and pinks

### Follicular Diagram (Days 6-13):
- [x] Uterus cross-section outline
- [x] Thickening endometrium
- [x] Developing follicle on ovary
- [x] Annotations: "endometrium rebuilding", "follicle growing"
- [x] Color: pinks and warm tones

### Ovulation Diagram (Days 14-15):
- [x] Uterus cross-section outline
- [x] Mature follicle with egg
- [x] LH surge visualization
- [x] Annotations: "LH surge", "egg release", "fallopian tube"
- [x] Color: amber and rose tones

### Luteal Diagram (Days 16-28):
- [x] Uterus cross-section outline
- [x] Thick, mature endometrium
- [x] Corpus luteum on ovary
- [x] Annotations: "corpus luteum", "progesterone peak"
- [x] Color: deeper rose and warm amber

### Diagram implementation:
- [x] Store each SVG as a string in JavaScript
- [x] Inject into fact card based on current phase
- [x] Size: approximately 280px wide, maintain aspect ratio
- [x] Style: organic lines, muted colors, textbook feel

---

## Step 9: Calendar View

### Calendar structure:
- [x] Month/year header with navigation arrows
- [x] Day-of-week header row (Sun-Sat)
- [x] 6-row grid of day cells
- [x] Current month displayed by default

### Calendar navigation:
- [x] "Previous month" button (left arrow)
- [x] "Next month" button (right arrow)
- [x] Update display when navigating

### Day cell styling:
- [x] Show day number (1-31)
- [x] Empty cells for days before month starts
- [x] Size: square cells, aspect-ratio 1
- [x] Subtle borders between cells

### Period day highlighting:
- [x] Mark logged period days with `var(--period-bg)`
- [x] Mark current day with special indicator (border)
- [x] Mark predicted period days with dashed border
- [x] Predicted period: from `next_period_start` to `next_period_start + period_length - 1`

### Calendar logic:
- [x] Calculate days in current month
- [x] Calculate first day of month (for empty cells)
- [x] Determine which days are period days
- [x] Determine which days are predicted period days

---

## Step 10: Settings View

### Settings panel:
- [x] Clean card-style layout
- [x] Section: "Cycle Settings"

### Cycle length setting:
- [x] Label: "Cycle Length"
- [x] Number input or stepper control
- [x] Default: 28
- [x] Range: 21-40 days
- [x] Save on change to localStorage

### Period length setting:
- [x] Label: "Period Length"
- [x] Number input or stepper control
- [x] Default: 5
- [x] Range: 1-10 days
- [x] Save on change to localStorage

### Data reset:
- [x] "Reset All Data" button
- [x] Confirmation dialog before reset
- [x] Clear localStorage
- [x] Show welcome screen again

### Back navigation:
- [x] "Back to Tracker" button or link
- [x] Return to Today view

---

## Step 11: Polish & Details

### Transitions & Animations:
- [x] Smooth fade transitions between views
- [x] Gentle hover effects on buttons
- [x] Calendar month transition animation

### Typography refinements:
- [x] Ensure Crimson Text loads before rendering
- [x] Fallback fonts if fonts fail to load
- [x] Line height comfortable for reading

### Responsive design:
- [x] Mobile-first approach
- [x] Stack layouts vertically on narrow screens
- [x] Calendar cells adapt to screen size
- [x] Touch-friendly button sizes (min 44px)

### Accessibility:
- [x] Semantic HTML elements
- [x] Proper heading hierarchy
- [x] Sufficient color contrast
- [x] Focus states for interactive elements

---

## File Structure

```
uma/
  uma.html      <- entire app (self-contained, single file)
  roadmap.md    <- this file
```

**No dependencies** (except Google Fonts for typography).

---

## Color System

| Element | Hex |
|---------|-----|
| Background | `#faf7f2` |
| Text | `#2d4a3e` |
| Dusty Rose (Accent) | `#c9a9a6` |
| Warm Amber (Accent) | `#d4a574` |
| Period Highlight | `#e8c4c4` |
| Predicted Period | `#e8c4c4` (dashed) |
| Border | `#d4c5b9` |

---

## Tone Guide

When writing UI text and biology facts, follow this voice:

**Do say:**
- "Your body is doing mammalian biology!"
- "The endometrium you built last month is now leaving — your body prepared and beautifully releases."
- "Every cycle is your body rehearsing the creation of possibility."

**Don't say:**
- Generic wellness fluff like "take care of yourself"
- Apologetic language about periods
- Clinical detachment

---

## Emotional Core

> *"Every cycle is your body rehearsing the creation of possibility. That deserves recognition, understanding, and celebration."*

---

## Success Checkpoints

Test at each stage:

1. [ ] Welcome screen appears on first visit
2. [ ] Data persists after page refresh
3. [ ] Cycle day calculates correctly
4. [ ] Period toggle updates dates
5. [ ] Calendar shows period days correctly
6. [ ] Predicted days appear on calendar
7. [ ] Biology facts display for current day
8. [ ] SVG diagrams render correctly
9. [ ] Settings save and apply changes
10. [ ] Reset clears everything properly

---

## Educational Content Reference

**Sample facts for each phase:**

Menstrual: "The endometrium you built last month is now leaving — 30-70mL of blood, tissue, and mucus. Your body prepared and beautifully releases."

Follicular: "Your pituitary gland (pea-sized but mighty) releases FSH. Your brain is literally talking to your ovaries."

Ovulation: "The LH surge is one of the most dramatic hormone events in the human body — a 10x spike in 24 hours. This triggers follicle rupture."

Luteal: "PMS symptoms are real. Progesterone's interplay with serotonin affects mood. It's chemistry, not 'being emotional.'"

---

**Built with love, science, and deep respect for the menstrual cycle.**
