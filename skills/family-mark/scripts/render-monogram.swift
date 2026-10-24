import AppKit
import CoreText
import Foundation

struct Placement {
    var scriptScale: CGFloat
    var overlap: CGFloat
    var baseline: CGFloat
}

let root = URL(fileURLWithPath: CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : FileManager.default.currentDirectoryPath)
let catalogURL = root.appendingPathComponent("catalog.json")
let styleURL = root.appendingPathComponent("styles/monogram/style.json")
let outDir = root.appendingPathComponent("styles/monogram/examples")

func loadJSON(_ url: URL) -> [String: Any] {
    let data = try! Data(contentsOf: url)
    return try! JSONSerialization.jsonObject(with: data) as! [String: Any]
}

func num(_ value: Any) -> CGFloat {
    CGFloat((value as! NSNumber).doubleValue)
}

func hex(_ s: String) -> CGColor {
    var value: UInt64 = 0
    Scanner(string: String(s.dropFirst())).scanHexInt64(&value)
    let r = CGFloat((value >> 16) & 0xff) / 255
    let g = CGFloat((value >> 8) & 0xff) / 255
    let b = CGFloat(value & 0xff) / 255
    return CGColor(srgbRed: r, green: g, blue: b, alpha: 1)
}

func glyphPath(_ text: String, _ name: String, _ size: CGFloat) -> CGPath {
    let font = CTFontCreateWithName(name as CFString, size, nil)
    let line = CTLineCreateWithAttributedString(NSAttributedString(string: text, attributes: [.font: font]))
    let path = CGMutablePath()
    for run in CTLineGetGlyphRuns(line) as! [CTRun] {
        let count = CTRunGetGlyphCount(run)
        var glyphs = Array(repeating: CGGlyph(0), count: count)
        var positions = Array(repeating: CGPoint.zero, count: count)
        CTRunGetGlyphs(run, CFRangeMake(0, count), &glyphs)
        CTRunGetPositions(run, CFRangeMake(0, count), &positions)
        let runFont = (CTRunGetAttributes(run) as NSDictionary)[kCTFontAttributeName] as! CTFont
        for i in 0..<count {
            guard let gp = CTFontCreatePathForGlyph(runFont, glyphs[i], nil) else { continue }
            path.addPath(gp, transform: CGAffineTransform(translationX: positions[i].x, y: positions[i].y))
        }
    }
    return path
}

func fitHeight(_ path: CGPath, _ height: CGFloat) -> CGPath {
    let s = height / path.boundingBox.height
    var t = CGAffineTransform(scaleX: s, y: s)
    return path.copy(using: &t)!
}

func move(_ path: CGPath, dx: CGFloat, dy: CGFloat) -> CGPath {
    var t = CGAffineTransform(translationX: dx, y: dy)
    return path.copy(using: &t)!
}

func placement(for product: [String: Any], style: [String: Any]) -> Placement {
    let script = style["script"] as! [String: Any]
    let mark = product["mark"] as! String
    let chars = Array(mark)
    let cap = String(chars[0])
    let second = chars[1]
    let tall = Set((script["tallLetters"] as! [String]).compactMap { $0.first })
    let narrow = Set(script["narrowCaps"] as! [String])
    let isTall = tall.contains(second)
    var p = Placement(
        scriptScale: num(isTall ? script["tallScale"]! : script["normalScale"]!),
        overlap: num(narrow.contains(cap) ? script["overlapNarrow"]! : (isTall ? script["overlapTall"]! : script["overlapNormal"]!)),
        baseline: num(isTall ? script["baselineTall"]! : script["baselineNormal"]!)
    )
    if let over = product["placement"] as? [String: Any] {
        if let v = over["scriptScale"] { p.scriptScale = num(v) }
        if let v = over["overlap"] { p.overlap = num(v) }
        if let v = over["baseline"] { p.baseline = num(v) }
    }
    return p
}

func paths(_ mark: String, _ place: Placement, _ style: [String: Any]) -> (CGPath, CGPath) {
    let capSpec = style["cap"] as! [String: Any]
    let scriptSpec = style["script"] as! [String: Any]
    let lockup = style["lockup"] as! [String: Any]
    let capChar = String(mark.prefix(1))
    let scriptChar = String(mark.suffix(1))
    let capH = num(capSpec["height"]!)
    let cap0 = fitHeight(glyphPath(capChar, capSpec["font"] as! String, 1000), capH)
    let scr0 = fitHeight(glyphPath(scriptChar, scriptSpec["font"] as! String, 1000), capH * place.scriptScale)
    let cap = move(cap0, dx: -cap0.boundingBox.minX, dy: -cap0.boundingBox.minY)
    var script = move(scr0, dx: -scr0.boundingBox.minX, dy: -scr0.boundingBox.minY)
    let cb = cap.boundingBox
    let sb = script.boundingBox
    script = move(script, dx: cb.maxX - cb.width * place.overlap - sb.minX, dy: cb.minY + cb.height * place.baseline - sb.minY)
    let pair = CGMutablePath()
    pair.addPath(cap)
    pair.addPath(script)
    let ub = pair.boundingBox
    let sc = min(num(lockup["maxWidth"]!) / ub.width, num(lockup["maxHeight"]!) / ub.height)
    var st = CGAffineTransform(scaleX: sc, y: sc)
    let capS = cap.copy(using: &st)!
    let scrS = script.copy(using: &st)!
    let fb = pair.copy(using: &st)!.boundingBox
    let dx = num(lockup["centerX"]!) - fb.midX
    let dy = num(lockup["centerY"]!) - fb.midY
    return (move(capS, dx: dx, dy: dy), move(scrS, dx: dx, dy: dy))
}

func render(_ mark: String, _ place: Placement, _ style: [String: Any]) -> NSImage {
    let (cap, scr) = paths(mark, place, style)
    let size = Int(num(style["canvas"]!))
    let space = num(style["space"]!)
    let tileSpec = style["tile"] as! [String: Any]
    let colors = style["colors"] as! [String: Any]
    let halo = num((style["script"] as! [String: Any])["halo"]!)
    let bg = hex(colors["background"] as! String)
    let ink = hex(colors["ink"] as! String)
    let image = NSImage(size: NSSize(width: size, height: size))
    image.lockFocus()
    let ctx = NSGraphicsContext.current!.cgContext
    let scale = CGFloat(size) / (space * 2)
    let origin = num(tileSpec["x"]!) * scale
    let side = num(tileSpec["size"]!) * scale
    let radius = num(tileSpec["radius"]!) * scale
    let tile = CGRect(x: origin, y: origin, width: side, height: side)
    let squircle = CGPath(roundedRect: tile, cornerWidth: radius, cornerHeight: radius, transform: nil)
    ctx.setFillColor(bg)
    ctx.addPath(squircle)
    ctx.fillPath()
    ctx.saveGState()
    ctx.addPath(squircle)
    ctx.clip()
    let k = (side / space)
    func map(_ path: CGPath) -> CGPath {
        var t = CGAffineTransform(scaleX: k, y: k).concatenating(CGAffineTransform(translationX: origin, y: origin))
        return path.copy(using: &t)!
    }
    ctx.setFillColor(ink)
    ctx.addPath(map(cap))
    ctx.fillPath()
    ctx.setStrokeColor(bg)
    ctx.setLineWidth(halo * k)
    ctx.setLineJoin(.round)
    ctx.setLineCap(.round)
    ctx.addPath(map(scr))
    ctx.strokePath()
    ctx.setFillColor(ink)
    ctx.addPath(map(scr))
    ctx.fillPath()
    ctx.restoreGState()
    image.unlockFocus()
    return image
}

func savePNG(_ image: NSImage, _ url: URL) {
    let rep = NSBitmapImageRep(data: image.tiffRepresentation!)!
    try! rep.representation(using: .png, properties: [:])!.write(to: url)
}

let catalog = loadJSON(catalogURL)
let style = loadJSON(styleURL)
let products = catalog["products"] as! [[String: Any]]
try! FileManager.default.createDirectory(at: outDir, withIntermediateDirectories: true)

var made: [(String, NSImage)] = []
for product in products {
    let name = product["name"] as! String
    let slug = product["slug"] as! String
    let mark = product["mark"] as! String
    let image = render(mark, placement(for: product, style: style), style)
    savePNG(image, outDir.appendingPathComponent("\(slug).png"))
    made.append(("\(name) \(mark)", image))
    print(slug, mark)
}

let cols = 4
let cell: CGFloat = 280
let rows = Int(ceil(Double(made.count) / Double(cols)))
let sheet = NSImage(size: NSSize(width: CGFloat(cols) * cell + 40, height: CGFloat(rows) * cell + 20))
sheet.lockFocus()
NSColor(srgbRed: 0.08, green: 0.08, blue: 0.09, alpha: 1).setFill()
NSRect(origin: .zero, size: sheet.size).fill()
for (i, item) in made.enumerated() {
    let col = i % cols
    let row = rows - 1 - i / cols
    let x = 20 + CGFloat(col) * cell
    let y = 28 + CGFloat(row) * cell
    item.1.draw(in: NSRect(x: x, y: y + 24, width: 220, height: 220))
    NSAttributedString(string: item.0, attributes: [
        .font: NSFont.systemFont(ofSize: 15, weight: .medium),
        .foregroundColor: NSColor(white: 0.88, alpha: 1)
    ]).draw(at: NSPoint(x: x, y: y))
}
sheet.unlockFocus()
savePNG(sheet, outDir.appendingPathComponent("sheet.png"))
print("sheet", made.count)
