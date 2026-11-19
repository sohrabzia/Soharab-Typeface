# Product Specification: Soharab Typeface & Cloudflare Pages Showcase

**Project Name:** Soharab Typeface Showcase  
**Designer:** [Sohrab Zia](https://sohrabzia.github.io/)  
**License:** 100% Free for Commercial & Non-Commercial / Personal Use  
**Target Hosting:** Cloudflare Pages (Global Edge Network)  
**Version:** 1.0.0  
**Status:** Production Ready  

---

## 1. Executive Summary & Product Vision

**Soharab** is a personal, authentic free-style handwriting variable typeface designed by [Sohrab Zia](https://sohrabzia.github.io/). Captured directly from physical pen-on-paper handwriting and converted to scalable vector contours, Soharab brings raw human warmth, expressive organic curves, and spontaneous creative energy to digital interfaces and print media.

The accompanying web showcase is a high-performance static web application deployed to Cloudflare Pages that mirrors this personal, artistic spirit through a tactile paper-and-ink studio aesthetic.

The product serves two parallel purposes:
1. **Font Distribution Product:** Provides designers, creators, and developers with both a continuous two-axis variable handwriting font (`Soharab-VF.ttf`, 100–900 pen pressure weight & -12°–0° cursive slant) and a lightweight static cut (`Soharab.ttf`).
2. **Interactive Type Sketchbook:** Delivers a tactile, responsive studio experience where users can test handwriting dynamically across pen pressures, slants, sizes, tracking, and paper textures (blank, ruled notebook, dot grid), inspect 75 handwritten glyphs, and copy ready-to-use CSS snippets.

---

## 2. Product Personas & User Journeys

| Persona | Primary Goal | Key Features Used |
| :--- | :--- | :--- |
| **Product & UI/UX Designers** | Evaluate letterforms, hierarchy, and slant dynamics for interface mockups. | Interactive Hero, Type Tester presets, Named Instances Waterfall, Dark/Light Mode. |
| **Frontend Engineers** | Integrate the font into web applications with minimal performance overhead. | One-click CSS Embed snippet, variable font settings generator, Cloudflare CDN distribution. |
| **Type Enthusiasts & Students** | Inspect character anatomy, unicode mappings, and variable axis limits. | 75-Glyph Character Inspector with baseline/centerline grid and unicode/entity metadata. |
| **Desktop / Mobile End-Users** | Install the font locally on macOS, Windows, or iOS devices. | Download cards with byte size indicators, cross-platform step-by-step install instructions. |

---

## 3. Font Asset Specifications

### 3.1 `Soharab-VF.ttf` (Variable TrueType)
* **File Size:** ~43.9 KB (43,892 bytes)
* **Format:** TrueType Variable Font (OpenType Font Variations)
* **Axes of Variation:**
  * **Weight (`wght`):** `100` (Thin) to `900` (Black)
  * **Slant (`slnt`):** `-12°` (Oblique/Italic) to `0°` (Upright)
* **Named Instances (Pre-configured Styles):**
  1. *Thin* (`wght: 100, slnt: 0°`)
  2. *Light* (`wght: 300, slnt: 0°`)
  3. *Regular* (`wght: 400, slnt: 0°`)
  4. *Medium* (`wght: 500, slnt: 0°`)
  5. *Bold* (`wght: 700, slnt: 0°`)
  6. *Black* (`wght: 900, slnt: 0°`)
  7. *Italic* (`wght: 400, slnt: -12°`)
  8. *Bold Italic* (`wght: 700, slnt: -12°`)

### 3.2 `Soharab.ttf` (Static TrueType)
* **File Size:** ~12.6 KB (12,624 bytes)
* **Format:** Standard Static TrueType
* **Weight:** `400` (Regular)
* **Slant:** `0°` (Upright)
* **Target Environment:** Embedded devices, older desktop applications without variable font support, and iOS configuration profiles where minimal payload is critical.

### 3.3 Glyph Set Coverage (75 Glyphs)
* **Uppercase Latin (26):** `A–Z` (`U+0041` – `U+005A`)
* **Lowercase Latin (26):** `a–z` (`U+0061` – `U+007A`)
* **Numerals (10):** `0–9` (`U+0030` – `U+0039`)
* **Punctuation & Symbols (13):** `[space]`, `!`, `"`, `'`, `(`, `)`, `,`, `-`, `.`, `/`, `:`, `;`, `?`

---

## 4. Web Application Architecture & Features

The specimen site is contained in a single static `index.html` file designed for Cloudflare Pages edge delivery with sub-second time-to-first-byte (TTFB).

```
soharab-cloudflare-pages/
├── Soharab-VF.ttf        # Primary variable font asset (44 KB)
├── Soharab.ttf           # Fallback static regular font asset (13 KB)
├── index.html            # Single-page responsive interactive specimen application
├── product.md            # Product specification and architectural documentation
├── readme.md             # Developer quickstart, integration guide, and deployment
└── _headers              # Cloudflare Pages edge caching and security headers
```

### 4.1 Feature Breakdown

#### A. Tactile Paper-and-Ink Studio UI
* **Design Language:** Warm tactile sketchbook aesthetic, parchment paper canvas (`#FAF7F0`), washi-tape style badges, subtle borders, and rich midnight charcoal ink in dark mode (`#121110`).
* **Theme Switching:** Dark and Light mode toggle with automatic persistence to `localStorage.getItem('soharab_theme')`.
* **License Terms:** 100% Free for commercial and non-commercial / personal use. Permitted across web, apps, print, merchandise, videos, and branding with zero licensing fees.

#### B. Dynamic Hero Specimen
* **Inline Editable Canvas:** Allows users to click and type arbitrary text directly into the hero headline using `contenteditable="true"`.
* **Instant Sliders:** Header-level controls for quick weight (100–900) and slant (0° to -12°) experimentation.

#### C. Interactive Type Tester Lab
* **Live Textarea:** Fluid multiline typing surface with real-time responsive scaling (16px to 144px).
* **Continuous Axis Sliders:** Independent sliders for Weight (`wght`), Slant (`slnt`), Letter Spacing / Tracking (`-0.08em` to `0.25em`), and Font Size.
* **Alignment Toggles:** Left, Center, and Right text justification controls.
* **Preset Buttons:** Quick specimen texts (Quote, Uppercase `A–Z`, Lowercase `a–z`, Numbers & Punctuation).
* **CSS Generator:** One-click button generating exact CSS `font-variation-settings` snippet copied to the system clipboard.

#### D. Named Instances Waterfall
* **Multi-weight Stack:** Simultaneous vertical comparison of all 8 named styles.
* **Custom Specimen Input:** Typing into the waterfall input updates all 8 weights synchronously.
* **Deep Linking / Selection:** Clicking any instance row updates the Type Tester controls and scrolls smoothly to the interactive lab.

#### E. Character & Glyph Inspector
* **Categorized Filters:** Quick filter tabs for All (75), Uppercase (26), Lowercase (26), Numerals (10), and Punctuation (13).
* **Active Variation Synchronization:** Glyphs in the grid render according to the active weight and slant selected in the tester.
* **Detailed Inspector Card:** Displays enlarged glyph on an anatomical grid with baseline and midline guides, Unicode point (e.g. `U+0041`), character name (e.g. `Latin Capital A`), and HTML entity code (e.g. `&#65;`).
* **Copy Glyph:** One-click copy of the raw character to clipboard.

#### F. Distribution & Installation Hub
* **Bento Grid Layout:** Clear card presentation with byte sizes and download triggers for both font cuts.
* **OS-Specific Guides:** Clear instructions for macOS Font Book, Windows Font Settings, and iOS profile installation via Fontcase / iFont.
* **Web CSS Embed Snippet:** Formatted `@font-face` block ready for copy-paste.

---

## 5. Non-Functional Requirements (NFRs)

| Category | Requirement | Target Metric |
| :--- | :--- | :--- |
| **Performance** | Zero external dependencies (except Tailwind CDN & Google Fonts fallback). Instant paint. | Lighthouse Performance Score: 98+; LCP < 0.8s on Cloudflare Edge. |
| **Accessibility (a11y)** | Semantic landmarks (`<header>`, `<main>`, `<section>`, `<footer>`), ARIA labels on theme buttons, accessible contrast. | WCAG 2.1 AA Compliance. |
| **Responsiveness** | Fluid fluid-type typography (`clamp()`), mobile touch slider support, responsive grid breakpoints (sm, md, lg). | Flawless rendering on iPhone SE (375px) up to 4K displays (3840px). |
| **Zero Build Pipeline** | Entire application runs out of the box with any standard web server or static host. | Zero `npm install` or compilation step required for deployment. |
| **Edge Optimization** | Fonts served with immutable cache headers and permissive CORS to allow web embedding. | `Cache-Control: public, max-age=31536000, immutable`, `Access-Control-Allow-Origin: *`. |

---

## 6. Cloudflare Pages Deployment Strategy

* **Edge Hosting:** Cloudflare Pages provides free global Anycast CDN edge distribution, automatic HTTPS/TLS certificates, and instant cache invalidation upon git pushes.
* **Build Settings:**
  * **Framework Preset:** None (Plain Static HTML)
  * **Build Command:** *(leave empty)*
  * **Build Output Directory:** `/` (root directory)
* **Custom Headers (`_headers`):**
  * CORS headers (`Access-Control-Allow-Origin: *`) enabled on `.ttf` files to permit cross-origin web font embedding.
  * Long-term caching enabled for immutable font assets.

---

## 7. Product Roadmap

1. **Phase 1 (Current):**
   - Core variable TrueType font delivery (`Soharab-VF.ttf`)
   - Interactive specimen single-page app on Cloudflare Pages
   - Dark/Light mode, waterfall, glyph inspector, copy CSS

2. **Phase 2 (Web Performance & Format Expansion):**
   - WOFF2 conversion pipeline (`Soharab-VF.woff2`, reducing asset size to ~18 KB)
   - Dynamic subsetting script for multi-lingual and localized builds
   - Add open-graph social share cards and favicon assets

3. **Phase 3 (Typeface Expansion):**
   - Extended Latin character support (diacritics, accents: `é`, `ñ`, `ü`, `ø`, etc.)
   - Common typographic ligatures (`fi`, `fl`, `ff`) and OpenType feature switches (`calt`, `liga`, `tnum`)
   - Kerning pairs optimization and custom spacing table inspections
