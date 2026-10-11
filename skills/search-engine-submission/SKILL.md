---
name: Search engine submission
description: >-
  When submitting a site to search engines: verifying in Google Search Console
  and Bing Webmaster Tools, submitting sitemaps, and setting up IndexNow.
---
# Search engine submission

Get a live site verified with search engines and its sitemap submitted, plus instant-indexing via IndexNow.

## Google Search Console
1. Add the property (prefer domain property via DNS TXT, or URL-prefix).
2. Verify (DNS TXT through your DNS provider is robust for a domain property).
3. Submit the sitemap (`/sitemap.xml`). Confirm it's read with no errors.
4. Use URL inspection to request indexing of key pages. If a page was previously removed/noindexed, cancel the removal and re-submit once it's indexable.

## Bing Webmaster Tools
1. Add each site. Fastest path is importing from Search Console; otherwise verify.
2. **CNAME verification:** Bing gives a **unique** verification token per site (not one user-wide token). Fetch the exact record name for each site and add a CNAME to Bing's verify target (DNS-only), then verify.
3. Submit each site's sitemap. A new subdomain must be added and verified separately.
4. If meta/XML verification is needed instead, add Bing's meta tag or the BingSiteAuth.xml file and ship it.

## IndexNow (instant indexing)
1. Generate a key; host the key file at the site root (`/<key>.txt` containing the key).
2. Submit URLs (or the sitemap URL) to the IndexNow API; a 200/202 means accepted.
3. **Automate it:** add an IndexNow push step to the deploy pipeline so each production deploy pings it. A shared script per host makes manual pushes easy too.
4. Don't confuse the IndexNow key file with a search-engine verification file — keep both.

## Verify
- GSC and Bing both show the property verified and the sitemap accepted.
- IndexNow returns 200/202 and runs on deploy.
- The live sitemap lists only this host's URLs (see technical-seo).

## Notes
- Some actions (console sign-in, sitemap submit) may need the user's own logged-in browser session rather than an API.
- Site scan / crawl-issue features are often UI-only (no API).
