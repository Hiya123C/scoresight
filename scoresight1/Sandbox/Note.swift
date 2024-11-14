//

import Foundation

struct Note: Identifiable {
    let id = UUID()
    var position: CGPoint
    var type: String //rest vs note
    var NoteLength: String
    var pitch: Int //unsure
}

enum NoteLength {
    case crochet
    case minim
    case quaver
}

enum NoteType{
    case rest
    case note
}






