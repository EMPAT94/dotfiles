// macocr — macOS Vision OCR CLI (French + English)
// build: swiftc -O macocr.swift -o ~/.local/bin/macocr
// usage: macocr image.png   -> text on stdout
//        macocr --json image.png -> {"text": "..."}
import Foundation
import Vision
import AppKit

var args = Array(CommandLine.arguments.dropFirst())
var asJSON = false
if let i = args.firstIndex(of: "--json") {
    asJSON = true
    args.remove(at: i)
}
guard let path = args.first else {
    FileHandle.standardError.write("usage: macocr [--json] <image>\n".data(using: .utf8)!)
    exit(2)
}

guard let img = NSImage(contentsOfFile: path),
      let cg = img.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
    FileHandle.standardError.write("error: cannot load image: \(path)\n".data(using: .utf8)!)
    exit(1)
}

let req = VNRecognizeTextRequest()
req.recognitionLevel = .accurate
req.recognitionLanguages = ["fr-FR", "en-US"]
req.usesLanguageCorrection = true

do {
    try VNImageRequestHandler(cgImage: cg).perform([req])
} catch {
    FileHandle.standardError.write("error: \(error)\n".data(using: .utf8)!)
    exit(1)
}

let lines: [String] = (req.results ?? []).compactMap { $0.topCandidates(1).first?.string }
let text = lines.joined(separator: "\n")

if asJSON {
    let payload: [String: Any] = ["text": text, "lines": lines.count]
    let data = try! JSONSerialization.data(withJSONObject: payload, options: [])
    print(String(data: data, encoding: .utf8)!)
} else {
    print(text)
}
