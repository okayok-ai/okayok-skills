---
name: Technical SEO setup
description: >-
  When setting up on-page and technical SEO for a product site: titles,
  descriptions, canonical, a single H1, robots, sitemap, structured data (generated),
  favicon, OG share images, heading hierarchy and internal linking.
---
# Technical SEO setup

Make a product site correctly indexable and distinct. The golden rule: **every site is independent** — its own content, titles, descriptions, and canonical URLs, never duplicating another site.

## Checklist
1. **Title & meta description.** Unique per page, product's own brand. Decide the brand convention (e.g. brand prefix in `<title>` for SEO vs short name in the header) and apply it consistently. Don't lose the brand name in the title.
2. **Canonical.** Each page points to its own canonical URL on its own host — never to the main site. Keep trailing-slash usage consistent.
3. **Exactly one H1 per page**, containing the page's core keywords and reflecting its content. Audit every key page (home, pricing, sign-in/up, category pages). Add missing H1s; fix pages with multiple H1s. For auth/app pages that shouldn't rank, set `noindex` instead.
4. **Sitemap.** Must list only the site's **own host** URLs (a common bug: a sub-site's sitemap emitting the main site's URLs — make the generator host-aware). All entries return 200, no duplicates or gaps. Localized pages are full entries.
5. **robots.txt.** Allow crawling of public pages; disallow admin/app/settings. Use `noindex` meta on pages you want crawled-but-not-indexed rather than blocking them in robots when they must be de-indexed.
6. **Structured data (JSON-LD).** WebSite and the product type (e.g. SoftwareApplication). Use the brand name; list the short name as alternateName. Keep it per-site. **Generate it, don't hand-write it** — see section 9.
7. **Favicon / OG / manifest.** Real logo at all sizes (search engines may cache old ones — replace every size and request a re-crawl). og:site_name set; OG image per section 10; manifest name + short_name correct.
8. **llms.txt / 404** page as applicable.

9. **JSON-LD generation (code, not copy-paste).** Keep one per-site config object — `name`, `alternateName` (short name), `url` (own origin, no trailing slash), `description`, `logo`, `inLanguage` (e.g. `["en","zh"]`), optional `applicationCategory`, `operatingSystem`, `offers` (`price`, `priceCurrency`; omit if no public price), `publisher`. A generator builds a `@graph` with `WebSite` and `SoftwareApplication` (stable `@id`s like `<url>/#website`, absolute logo URL) and the root layout emits it once as `<script type="application/ld+json">` (escape `<` as `\u003c`). New sites only edit the config. Reference implementation: [`jsonld.ts`](jsonld.ts) in this folder.
10. **OG / share image standard.**
    - One 1200×630 PNG **per locale** (e.g. `/og-en.png`, `/og-zh.png`) showing the site's **own logo + slogan** (hero headline/subheadline from the locale messages), brand name and host. Never reuse another site's image or a generic template image.
    - Render it from code so it stays in sync with copy: a script loads the logo SVG and locale messages into an HTML template and screenshots it with headless Chrome at 1200×630 (memwork pattern: `scripts/og-image.mjs` → `public/og-{en,zh}.png`). For CJK text, break lines only between phrases/sentences (`word-break: keep-all`, nowrap phrase spans) so words never split.
    - Tags, from one helper (e.g. `socialMeta({ title, description, url, locale, type, image? })`): `og:title`, `og:description`, `og:url` (= canonical), `og:type`, `og:site_name`, `og:locale` (`zh_CN` / `en_US`), `og:image` (**absolute** URL, locale-specific), `og:image:width/height/type` for the default image, `twitter:card=summary_large_image`, `twitter:title`, `twitter:description`, `twitter:image`. Pages override title/description; articles may pass their cover as `image`.
11. **Heading hierarchy (H1–H6).** Exactly one H1 per page; H2 for main sections; H3 for subsections within an H2, and so on — never skip levels (no H2 → H4). Headings describe the content that follows; don't use heading tags for styling (use classes) and don't style plain text to look like a heading where it is one. Logos, nav, footer titles and card labels are not headings unless they head a section. Keep the outline meaningful when read alone.
12. **Internal linking.**
    - Descriptive anchor text (what the target is), not "click here" / "more".
    - Every indexable page reachable within ~3 clicks of the home page and listed in the sitemap; no orphan pages.
    - Link related pages to each other (features ↔ pricing ↔ docs/blog posts); header + footer nav cover the main sections.
    - Localized pages link their equivalent in other locales (language switcher + `hreflang` alternates).
    - Cross-product links go through the shared footer (served from api.okayok.ai), not ad-hoc per-site lists.
    - Use plain crawlable `<a href>` links; `rel="nofollow"` only for auth/app links (sign-in, sign-up, dashboard).

## Verify live
- Fetch the real pages: each has its own title, one H1, correct canonical.
- The live sitemap contains only this host's URLs, all 200.
- Favicon/OG resolve to the new assets.
- JSON-LD: exactly one WebSite + SoftwareApplication block with this site's name/url; passes the Rich Results Test / Schema validator.
- OG: `og:image` is absolute and returns 200 as a 1200×630 PNG; zh pages serve the zh image and `og:locale=zh_CN`, en pages the en image; a share debugger (X, Facebook, LinkedIn) shows the large card.
- Heading outline (e.g. a headings extension or `document.querySelectorAll('h1,h2,h3,h4,h5,h6')`): one H1, no skipped levels.
- Crawl the site (e.g. a site audit): no orphan pages, every indexable page ≤3 clicks deep, no broken internal links; nofollow only on auth/app links.

## Anti-patterns
- Shared/boilerplate titles across sites.
- A sub-site canonical or sitemap pointing at the main domain.
- Zero or multiple H1s on the landing page.
- Hand-copied JSON-LD that still names another site, or multiple conflicting JSON-LD blocks.
- One OG image for all locales, relative `og:image` URLs, or the template's placeholder image left in production.
- Skipped heading levels or headings used for font size.
- Orphan pages, "click here" anchors, or nofollow on normal internal links.

## Hand-off
Next: search-engine-submission.
