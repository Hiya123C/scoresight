import Foundation

struct Note: Identifiable {
    let id = UUID()
    var position: CGPoint
    var type: String //image...
    var pitch: Int //unsure
}

