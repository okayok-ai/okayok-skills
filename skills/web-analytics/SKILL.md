---
name: Web analytics setup
description: >-
  When adding web analytics to a product site: GA4 data streams and a
  session-analytics tool, unified under one property, and verifying they fire
  live.
---
# Web analytics setup

Instrument a product site so traffic and behavior are measured, unified across the product family.

## Approach
- **One analytics property for the family**, with a separate **data stream per site/subdomain**, so each site has its own measurement ID but rolls up to one place. Create a new GA4 web data stream for each new site and grab its measurement ID.
- Add a **session-analytics / heatmap tool** (e.g. a Clarity-style tool) with one shared project ID across sites, or per-site as you prefer.

## Steps
1. Create the GA4 web stream for the site's domain; copy the measurement ID.
2. Add the GA4 ID and the session-analytics ID to the site (via env/config, not hardcoded secrets).
3. Deploy.
4. **Verify live:** load the site and confirm the analytics scripts load and send a pageview/event (realtime view or network requests). Don't assume — check the beacon actually fires.

## Notes
- Keep IDs in the host's env config; they're not secret but belong with config, not scattered in code.
- If a site shows no data after deploy, check the ID is correct for that stream and the script isn't blocked by consent/adblock logic.

## Verify
- Realtime shows the visit.
- Each site reports under its own stream within the shared property.
