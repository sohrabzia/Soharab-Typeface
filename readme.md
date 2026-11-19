# Soharab — My Handwriting · Free-Style Variable Typeface

A personal, expressive free-style handwriting variable typeface and interactive web specimen engineered for rapid deployment to **Cloudflare Pages**, created by [Sohrab Zia](https://sohrabzia.github.io/).

Captured directly from natural pen strokes on paper, Soharab brings organic warmth, casual handwriting charm, and dynamic ink variation to modern digital design.

Features continuous pen pressure weight (`100–900`) and cursive writing slant (`-12°–0°`) variation axes, 8 expressive handwriting instances, a 75-character glyph set, an interactive sketchbook lab with notebook paper textures, and instant font downloads.

---

## ⚡ Quick Links

- **Variable Font File:** [`Soharab-VF.ttf`](./Soharab-VF.ttf) (43.9 KB)
- **Static Regular Font File:** [`Soharab.ttf`](./Soharab.ttf) (12.6 KB)
- **Interactive Specimen:** [`index.html`](./index.html)
- **AI Agent Summary:** [`llms.txt`](./llms.txt)
- **Full AI Technical Reference:** [`llms-full.txt`](./llms-full.txt)
- **XML Sitemap:** [`sitemap.xml`](./sitemap.xml)
- **Product Specification & Architecture:** [`product.md`](./product.md)

---

## ✨ Features

- **Authentic Free-Style Handwriting:** Direct vector digitization of authentic hand-drawn lettering.
- **100% Free for Commercial & Non-Commercial Use:** Free for both commercial and personal projects with zero license fees or royalties.
- **Continuous 2-Axis Variable Font:** Real-time dynamic control across Pen Pressure / Weight (`wght`: `100` fine nib to `900` marker) and Slant (`slnt`: `-12°` casual cursive tilt to `0°` upright print).
- **Interactive Sketchbook Lab:** Test arbitrary text in real-time with paper mode selectors (Blank, Ruled Notebook Lines, Dot Grid), adjustable size (`16px–144px`), tracking, and alignment.
- **One-Click CSS Generator:** Instantly copy exact `font-variation-settings` rules for web projects.
- **8 Handwriting Expressions Waterfall:** Visual stack previewing Fine Nib, Pencil, Handwriting, Gel Pen, Felt Tip, Marker, Casual Slant, and Expressive Script with live synchronized specimen text.
- **75-Glyph Character Sheet:** Categorized view (A–Z, a–z, 0–9, punctuation) with an anatomical grid, notebook baseline guides, unicode code points, and HTML entities.
- **Paper & Ink Studio Palette:** Warm tactile paper aesthetic with dark mode support and persistent `localStorage` theme state.
- **Zero Build Step:** 100% static HTML, CSS, and Vanilla JavaScript—no compilation, bundlers, or package manager required.
- **Cloudflare Pages Ready:** Out-of-the-box support for Cloudflare Pages edge delivery with optimal caching and CORS font embedding headers.

---

## 📐 Font Specifications

| Metric | Variable (`Soharab-VF.ttf`) | Static (`Soharab.ttf`) |
| :--- | :--- | :--- |
| **File Size** | 43,892 bytes (~43.9 KB) | 12,624 bytes (~12.6 KB) |
| **Format** | TrueType Variable (`.ttf`) | TrueType (`.ttf`) |
| **Weight Axis (`wght`)** | `100` (Thin) to `900` (Black) | `400` (Regular) |
| **Slant Axis (`slnt`)** | `-12°` (Oblique/Italic) to `0°` (Upright) | `0°` (Upright) |
| **Named Instances** | 8 instances | 1 instance |
| **Glyph Count** | 75 glyphs | 75 glyphs |

### Named Instances (Handwriting Expressions)

1. **Thin (Fine Nib):** `wght: 100`, `slnt: 0°`
2. **Light (Pencil / Sketch):** `wght: 300`, `slnt: 0°`
3. **Regular (Natural Handwriting):** `wght: 400`, `slnt: 0°`
4. **Medium (Gel Pen):** `wght: 500`, `slnt: 0°`
5. **Bold (Felt Tip):** `wght: 700`, `slnt: 0°`
6. **Black (Heavy Marker):** `wght: 900`, `slnt: 0°`
7. **Casual Slant:** `wght: 400`, `slnt: -12°`
8. **Expressive Script:** `wght: 700`, `slnt: -12°`

### Supported Glyph Set (75 Characters)

```
Uppercase:   A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
Lowercase:   a b c d e f g h i j k l m n o p q r s t u v w x y z
Numerals:    0 1 2 3 4 5 6 7 8 9
Punctuation: [space] ! " ' ( ) , - . / : ; ?
```

---

## 🌐 Web Integration & Usage

### 1. `@font-face` CSS Declaration

Add the font definition to your CSS stylesheet:

```css
@font-face {
  font-family: 'Soharab';
  src: url('./Soharab-VF.ttf') format('truetype');
  font-weight: 100 900;
  font-style: oblique 0deg 12deg;
  font-display: swap;
}

/* Fallback for static regular cut */
@font-face {
  font-family: 'Soharab Static';
  src: url('./Soharab.ttf') format('truetype');
  font-weight: 400;
  font-style: normal;
  font-display: swap;
}
```

### 2. Applying Variations in CSS

```css
/* Base usage */
.heading-soharab {
  font-family: 'Soharab', sans-serif;
  font-weight: 700;
}

/* Precise axis control */
.custom-typography {
  font-family: 'Soharab', sans-serif;
  font-variation-settings: 'wght' 650, 'slnt' -8;
  letter-spacing: -0.01em;
}
```

### 3. Tailwind CSS Configuration

Extend your `tailwind.config.js`:

```javascript
module.exports = {
  theme: {
    extend: {
      fontFamily: {
        soharab: ['Soharab', 'sans-serif'],
      },
    },
  },
};
```

Then apply in HTML:

```html
<h1 class="font-soharab font-bold text-4xl">
  Soharab Typeface
</h1>
```

---

## 💻 Desktop & Mobile Installation

### macOS
1. Download [`Soharab-VF.ttf`](./Soharab-VF.ttf) or [`Soharab.ttf`](./Soharab.ttf).
2. Double-click the file to open **Font Book**.
3. Click **Install Font**.
4. The font will be available in Photoshop, Illustrator, Figma, Word, and system apps.

### Windows
1. Download the font file.
2. Right-click the `.ttf` file and select **Install** (or **Install for all users**).
3. The typeface will appear under your system font family list.

### iPhone & iPad (iOS / iPadOS)
1. Download the font file to the **Files** app.
2. Open a font installer utility such as **Fontcase** or **iFont** (available on the App Store).
3. Import `Soharab-VF.ttf` and tap **Install**.
4. Navigate to **Settings > General > VPN & Device Management** and tap **Install Profile**.
5. Once verified, Soharab will be active across compatible iOS creative apps (Pages, Keynote, Affinity, Procreate).

---

## 🚀 Local Development & Preview

Because this project requires no compilation step, you can serve it locally using any static web server:

### Option A: Python 3
```bash
python3 -m http.server 8000
```
Open [http://localhost:8000](http://localhost:8000) in your browser.

### Option B: Node.js (`npx serve`)
```bash
npx serve .
```

### Option C: Cloudflare Wrangler (Local Preview)
```bash
npx wrangler pages dev .
```

---

## ☁️ Cloudflare Pages Deployment

### Method 1: Git Integration (Recommended)
1. Push this repository to GitHub or GitLab.
2. Go to the **Cloudflare Dashboard** > **Workers & Pages** > **Create application** > **Pages** > **Connect to Git**.
3. Select your repository.
4. Set the build configuration:
   - **Framework preset:** `None`
   - **Build command:** *(leave empty)*
   - **Build output directory:** `/` (or root `.`)
5. Click **Save and Deploy**. Cloudflare will deploy the specimen globally to `*.pages.dev`.

### Method 2: Direct Upload via Wrangler CLI
```bash
# Log in to Cloudflare
npx wrangler login

# Deploy current folder directly to Cloudflare Pages
npx wrangler pages deploy . --project-name=soharab
```

### Custom Edge Headers (`_headers`)
A `_headers` file is provided in this project to configure:
- **CORS:** Allows other web domains to embed `Soharab-VF.ttf` via `@font-face` without cross-origin blocks.
- **Cache-Control:** Long-lived 1-year immutable caching for static font assets (`public, max-age=31536000, immutable`).
- **Security:** Standard security headers (`X-Content-Type-Options: nosniff`, `Referrer-Policy`).

---

## 📁 Repository Structure

```
soharab-cloudflare-pages/
├── .agents/
│   └── skills/
│       ├── cloudflare-pages/
│       │   └── SKILL.md             # Cloudflare Pages deployment & edge rules
│       ├── font-engineering/
│       │   └── SKILL.md             # WOFF2 compression, subsetting & fonttools
│       └── specimen-auditing/
│           └── SKILL.md             # Typography UX, a11y & visual testing
├── Soharab-VF.ttf                   # Variable font file (axes: wght 100-900, slnt -12°-0°)
├── Soharab.ttf                      # Static regular font file (weight 400)
├── index.html                       # Apple-inspired interactive specimen web app
├── product.md                       # Comprehensive product specification & architecture
├── readme.md                        # Project documentation & developer guide
└── _headers                         # Cloudflare Pages headers (CORS, cache-control)
```

---

## 📄 License & Terms of Use

Designed by [Sohrab Zia](https://sohrabzia.github.io/).

**100% Free for Commercial and Non-Commercial Use:**
- ✅ **Commercial Work:** Use freely in client projects, logos, branding, websites, mobile applications, video games, YouTube videos, posters, advertisements, and physical merchandise.
- ✅ **Personal & Creative:** Use in digital planners (GoodNotes / Notability), zines, personal blogs, art prints, and hobby projects.
- ✅ **Web Embedding:** Self-host freely on commercial and personal websites without pageview limits or recurring fees.
- ✅ **No Royalties:** Zero licensing costs or royalties required. Attribution to [sohrabzia.github.io](https://sohrabzia.github.io/) is appreciated!
