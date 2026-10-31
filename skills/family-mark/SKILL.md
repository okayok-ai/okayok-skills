---
name: Family mark
description: >-
  Draw an Okayok-family app icon in a registered visual style. Use when
  creating or updating marks for Browseokay, Designokay, Genokay, Learnokay,
  Lightokay, Memwork, Protookay, Shotokay, or Slideokay, or when adding another icon style.
---
# Family mark

One catalog of product names, many visual styles. The default style is `monogram`. Do not invent a second letter pair for a name that is already in the catalog.

## Files
- [catalog.json](catalog.json) — the `*okay` products and their marks. Okayok itself is not in this list. Genokay's mark is `Ge`. Memwork's mark is `Me`.
- [styles/index.json](styles/index.json) — registered styles. `default` is the style to use when nobody names one.
- `styles/<id>/style.json` — tokens for that style. Monogram 的字号、`maxWidth`、描边只读这里。
- `styles/<id>/examples/` — checked-in renders. Monogram 的参考图就是 `styles/monogram/examples/` 下的单张 PNG 和 `sheet.png`。不要新增单独的参考图文件。

## Draw a mark
1. Read the catalog row for the product. The `mark` is two letters: a Didot capital and a script lowercase. 字母对是产品名的前两个字母。Memwork → `Me`。禁止用最后一个辅音当第二字，所以不是 `Mw`。catalog 里已有的 `mark` 直接用，不要另造。
2. Read `styles/index.json`. Use the requested style, otherwise `default`.
3. 只改 `catalog.json` 的 `mark` 和 `placement`。字号、`maxWidth`、描边只读 `styles/monogram/style.json`。禁止为某一个字改 `scripts/render-monogram.swift`，禁止新增 `maxWidth` 之类的字段。`lockup.maxWidth` 只读 style.json（现在是 `360`），不要改成 `520`。
4. 新手写字母必须对照 `styles/monogram/examples/` 里同一个手写字母的定稿，不能凭感觉。`e` 对照 `designokay.png`（`De`）。手写字母贴在大写右下，不横贯整字，不裁出圆角方块。
5. On macOS, regenerate with the style's script. For monogram:

```bash
swift skills/family-mark/scripts/render-monogram.swift skills/family-mark
```

Run that from the repository root. It writes `styles/monogram/examples/<slug>.png` and `sheet.png`.
6. 生成后打开该产品的定稿 PNG 和 `sheet.png` 对照。墨水纵向范围和边距要落在已定稿同一档。对不上就改 `placement` 再渲染，不要手改 PNG。
7. 下表是已定稿 placement，下次锁定沿用。`scriptScale` 是字号，`overlap` 是重叠，`baseline` 是基线。更宽的大写只允许微调 `overlap`，让手写字母仍落在右下。字号和基线保持和同一个手写字母的定稿一致。没有 `placement` 的沿用 style.json，不要补数字。

| 产品 | mark | scriptScale | overlap | baseline | 对照 |
| --- | --- | --- | --- | --- | --- |
| Designokay | De | 0.5 | 0.62 | 0.02 | designokay.png |
| Memwork | Me | 0.5 | 0.55 | 0.02 | memwork.png |
| Lightokay | Lo | 0.46 | 0.28 | 0.06 | lightokay.png |
| Slideokay | Sl | 0.78 | 0.38 | -0.02 | slideokay.png |

Shotokay `Sh`、Learnokay `Le`、Browseokay `Br`、Protookay `Pr`、Genokay `Ge` 没有 placement。
8. Ship the 1024 PNG. The squircle is part of the artwork. Do not also mask it into a different corner radius.

## Monogram rules
- Canvas 1024. Tile from `style.json`: origin 100, size 824, corner radius 185.
- Background `#0B0C10`, ink `#F5F5F0`.
- Capital: Didot Bold. Second letter: Snell Roundhand Black, with a background-colored halo so it separates from the capital.
- The pair is optically centered in the tile. The script letter sits on the lower right of the capital.
- Letter pair is the first two letters of the product name (`Lightokay` → `Lo`, `Memwork` → `Me`). Do not use the last consonant as the second letter. Do not prefix `Okayok`.

## Add a product
Add one object to `catalog.json` with `slug`, `name`, and `mark`. 字母对和 placement 按 Draw a mark 的规则与锁定表。Then render every registered style and commit the new example. Do not add Okayok, the parent brand.

## Add a style
Add `styles/<id>/` with `style.json`, `examples/`, and a renderer script if the geometry is not the monogram script. Register it in `styles/index.json`. Do not change existing style folders or existing example pixels when adding a style. Do not change `default` unless the user says the new style replaces it.

## Do not
- Restyle the Okayok parent mark as one of these products.
- Swap Lucide icons in for a family mark.
- Edit an example PNG by hand. Change `placement`, then re-render.
- Change `render-monogram.swift`, or add a `maxWidth` field, to fit one letter.
- Add a reference image outside `styles/monogram/examples/`.
