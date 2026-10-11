---
name: Desktop app release
description: >-
  When releasing a macOS (or cross-platform) desktop app: icon, code signing and
  notarization, publishing installers to GitHub Releases, auto-update, and
  speeding up signing.
---
# Desktop app release

Ship a signed, notarized desktop app that users can download and that auto-updates.

## Icon & branding
- Generate the app icon in the family style, at all required sizes; apply to the app bundle, the site favicon/logo, OG, and screenshots.

## Build & sign (macOS)
1. Bump the version in the app manifest; add a release-notes line.
2. Package the app for the target arch (e.g. Apple silicon).
3. **Code sign** with your Developer ID. Sign **only the Mach-O code, each file once**, plus the app's nested components — don't deep-sign every data file (language packs, images, assets). Signing hundreds of non-code files (each fetching a timestamp) is the usual cause of slow signing; signing only code can cut it from minutes to seconds. The app's outer signature still covers the data files.
4. **Notarize** the app with Apple, staple the ticket, and verify with Gatekeeper (`spctl`) + strict deep codesign.
5. Build the dmg/zip from the stapled app; **sign and notarize the dmg too** so the first download opens cleanly. (Notarizing only the app and not the dmg saves time but weakens the first-open experience — keep dmg notarization unless the user opts out.)

## Slimming the installer (optional, no caching)
- Ship only the languages you support (prune other locale packs from the app and the framework).
- Exclude source maps, TS sources, tests, and docs from the bundled app files.
- These shrink the download; they don't weaken signing or notarization.

## Publish & auto-update
- Publish installers to a **public GitHub Releases repo** with versioned tags (keep app source private if needed). Don't rely on ad-hoc file links.
- Include the update feed/manifest (e.g. RELEASES.json / latest-mac.yml) pointing at the new version so existing users auto-update.
- The site's download page should read the latest published release dynamically, so it needs no change per release.

## Migration note
- When renaming an app that existing users already run, keep the internal bundle id / data dir / update channel on the old identifier so current users still receive updates; change only the user-facing name.

## Verify
- Release is public with dmg + zip + update manifest.
- Gatekeeper accepts the dmg; app is notarized and passes strict deep codesign.
- Auto-update feed and the site download link both point to the new version.
- First real release after a signing-config change is the true test — watch notarization accept both app and dmg; if it rejects, stop before publishing a broken build.
