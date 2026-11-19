---
name: specimen-auditing
description: >-
  Audit, test, and enhance typographic specimen web pages for accessibility (a11y), responsive layout,
  font-display performance, and interactive variable font sliders.
---

# Typography Specimen Auditing & Testing Skill

Use this skill when testing, auditing, or refining interactive typography specimen web applications and font testing tools.

---

## 1. Accessibility (a11y) Auditing Standards

Typography specimens must remain fully accessible to users with screen readers, keyboard-only navigation, and visual impairments.

### A. Range Slider Controls
All interactive sliders (`<input type="range">`) must have:
- An associated accessible label or `aria-label` attribute:
  ```html
  <input id="testerWeight" type="range" min="100" max="900" value="400" aria-label="Font Weight" aria-valuemin="100" aria-valuemax="900" aria-valuenow="400" />
  ```
- Clear focus indicators (`focus:ring-2 focus:ring-blue-500/50`).
- Keyboard step control (`ArrowLeft`, `ArrowRight`, `PageUp`, `PageDown`).

### B. Color Contrast Ratios
- Primary text against background: minimum **4.5:1** for regular text, **3:1** for large text (>= 24px or >= 18.5px bold).
- Light mode: `#1D1D1F` on `#FBFBFD` (~15.8:1 contrast ratio, passes AAA).
- Dark mode: `#F5F5F7` on `#0A0A0C` (~17.2:1 contrast ratio, passes AAA).
- Secondary metadata and sliders: Ensure labels maintain minimum **3:1** contrast.

### C. Live Region for Clipboard Actions
When copying CSS or characters, announce the action to assistive technologies using an `aria-live="polite"` container:
```html
<div id="toast" role="status" aria-live="polite" class="..."></div>
```

---

## 2. Cross-Browser Variable Font Rendering

Variable font axes rely on CSS Font Variations Module Level 4:

### Syntax Compatibility
Always pair standard CSS font properties with `font-variation-settings` for maximum compatibility:

```css
/* Standard CSS syntax where supported */
font-weight: 600;
font-style: oblique 8deg;

/* Fallback/Explicit axis assignment */
font-variation-settings: 'wght' 600, 'slnt' -8;
```

**Known Browser Nuances:**
- **Safari / WebKit:** Supports negative slant angles directly (`'slnt' -12`). Ensure `@font-face` specifies `font-style: oblique 0deg 12deg;` or `font-style: normal;`.
- **Firefox / Gecko:** In older Firefox versions, ensure `font-display: swap` is included to prevent layout shifts from blocking rendering.
- **Chrome / Chromium:** Excellent support; ensure text rendering smoothing is configured:
  ```css
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  ```

---

## 3. Performance & Core Web Vitals (CWV)

### A. Cumulative Layout Shift (CLS)
- Preload the primary variable font in `<head>` if it represents above-the-fold content:
  ```html
  <link rel="preload" href="./Soharab-VF.ttf" as="font" type="font/ttf" crossorigin />
  ```
- Always include `font-display: swap` to prevent Flash of Invisible Text (FOIT).

### B. Input Responsiveness (INP)
- Slider updates to `font-variation-settings` run synchronously on the DOM.
- For extremely large specimen strings, batch DOM style updates using `requestAnimationFrame`:
  ```javascript
  let rafId = null;
  function scheduleSync() {
    if (rafId) cancelAnimationFrame(rafId);
    rafId = requestAnimationFrame(() => {
      syncTester();
    });
  }
  ```

---

## 4. Verification & Testing Workflow

1. **Lighthouse Audit:**
   Run Lighthouse in Chrome DevTools to audit Performance, Accessibility, and Best Practices.
2. **Keyboard Traversal Test:**
   Tab through all preset buttons, sliders, alignment controls, and copy actions without touching a mouse.
3. **Mobile Touch Test:**
   Inspect range slider touch responsiveness on iOS Safari and Android Chrome simulators.
