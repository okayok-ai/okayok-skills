---
name: Family mark
description: >-
  Draw an Okayok-family app icon in a registered visual style. Use when
  creating or updating marks for Browseokay, Designokay, Learnokay, Lightokay,
  Protookay, Shotokay, or Slideokay, or when adding another icon style.
---
# Family mark

One catalog of product names, many visual styles. The default style is `monogram`. Do not invent a second letter pair for a name that is already in the catalog.

## Files
- [catalog.json](catalog.json) — the seven `*okay` products and their marks. Okayok itself is not in this list.
- [styles/index.json](styles/index.json) — registered styles. `default` is the style to use when nobody names one.
- `styles/<id>/style.json` — tokens for that style.
- `styles/<id>/examples/` — checked-in renders. These are the reference, not a sketch.

## Draw a mark
1. Read the catalog row for the product. The `mark` is two letters: a Didot capital and a script lowercase.
2. Read `styles/index.json`. Use the requested style, otherwise `default`.
3. On macOS, regenerate with the style's script. For monogram:

```bash
swift skills/family-mark/scripts/render-monogram.swift skills/family-mark
```

Run that from the repository root. It writes `styles/monogram/examples/<slug>.png` and `sheet.png`.
4. If a product has a `placement` object, keep it. That object is the approved offset for that letter pair. Do not retune it unless the user asks to change that mark.
5. Ship the 1024 PNG. The squircle is part of the artwork. Do not also mask it into a different corner radius.

## Monogram rules
- Canvas 1024. Tile from `style.json`: origin 100, size 824, corner radius 185.
- Background `#0B0C10`, ink `#F5F5F0`.
- Capital: Didot Bold. Second letter: Snell Roundhand Black, with a background-colored halo so it separates from the capital.
- The pair is optically centered in the tile. The script letter sits on the lower right of the capital.
- Letter pair is the first two letters of the product name (`Lightokay` → `Lo`). Do not prefix `Okayok`.

## Add a product
Add one object to `catalog.json` with `slug`, `name`, and `mark`. Then render every registered style and commit the new example. Do not add Okayok, the parent brand.

## Add a style
Add `styles/<id>/` with `style.json`, `examples/`, and a renderer script if the geometry is not the monogram script. Register it in `styles/index.json`. Do not change existing style folders or existing example pixels when adding a style. Do not change `default` unless the user says the new style replaces it.

## Do not
- Restyle the Okayok parent mark as one of these seven.
- Swap Lucide icons in for a family mark.
- Edit an example PNG by hand. Change `placement` or `style.json`, then re-render.
