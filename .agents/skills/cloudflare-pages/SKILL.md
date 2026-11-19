---
name: cloudflare-pages
description: >-
  Deploy, preview, and configure static sites and web assets on Cloudflare Pages using Wrangler CLI,
  git integration, custom headers, and cache-control rules.
---

# Cloudflare Pages Deployment & Edge Optimization Skill

Use this skill when developing, testing, deploying, or configuring static web projects and font assets on Cloudflare Pages.

---

## 1. Project Architecture for Cloudflare Pages

Cloudflare Pages distributes static assets across Cloudflare's Anycast global network of 300+ data centers. For a pure static site like `soharab-cloudflare-pages`:

- **Build Output Directory:** Root directory (`.`) or `/`
- **Build Command:** None (pure static asset delivery)
- **Configuration Files:**
  - `_headers`: Custom HTTP response headers (CORS, Cache-Control, Security)
  - `_redirects`: URL rewrites and redirects
  - `_routes.json`: Optional routing rules (when using Cloudflare Pages Functions)

---

## 2. Local Previewing with Wrangler

Test the exact Cloudflare Pages edge runtime behavior locally using Cloudflare's Wrangler CLI.

### Run Local Development Server
```bash
# Preview using wrangler pages dev
npx wrangler pages dev . --port 8788
```

This simulates Cloudflare's edge environment and enforces `_headers` and `_redirects` rules locally.

---

## 3. Direct Deployment via Wrangler CLI

When deploying directly without a connected Git repo:

### Step 1: Authenticate with Cloudflare
```bash
npx wrangler login
```

### Step 2: Deploy to Production
```bash
npx wrangler pages deploy . --project-name=soharab --branch=main
```

### Step 3: Deploy to a Preview Environment
```bash
npx wrangler pages deploy . --project-name=soharab --branch=preview-new-features
```

---

## 4. Configuring `_headers` for Font Assets

Web fonts served from Cloudflare Pages must include CORS headers if other sites embed them, and aggressive immutable caching headers to minimize bandwidth:

```ini
# Security headers for all routes
/*
  X-Content-Type-Options: nosniff
  X-Frame-Options: SAMEORIGIN
  Referrer-Policy: strict-origin-when-cross-origin

# Font caching & CORS for .ttf and .woff2 files
/*.ttf
  Access-Control-Allow-Origin: *
  Access-Control-Allow-Methods: GET, HEAD, OPTIONS
  Cache-Control: public, max-age=31536000, immutable

/*.woff2
  Access-Control-Allow-Origin: *
  Access-Control-Allow-Methods: GET, HEAD, OPTIONS
  Cache-Control: public, max-age=31536000, immutable

# Ensure HTML is revalidated to serve new builds instantly
/*.html
  Cache-Control: public, max-age=0, must-revalidate
```

---

## 5. Verification Checklist

Before or after deploying to Cloudflare Pages, verify:

1. **Verify Asset HTTP Headers:**
   ```bash
   curl -I https://<project>.pages.dev/Soharab-VF.ttf
   ```
   Check that `access-control-allow-origin: *` and `cache-control: public, max-age=31536000, immutable` are returned.

2. **Verify Response Codes:**
   Confirm `index.html` returns `HTTP/2 200` or `HTTP/3 200`.

3. **Check Custom Domains:**
   In Cloudflare Dashboard, go to **Pages > Project > Custom Domains** to attach an apex domain (e.g., `soharab.com`) or subdomain.
