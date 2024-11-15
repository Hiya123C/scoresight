//

import Foundation

struct Note: Identifiable {
    let id = UUID()
    var position: CGPoint
    var NoteLength: NoteLength
    var pitch: Int
}

enum NoteLength {
    case crochet
    case minim
    case quaver
    
    var lengthMultiplier: Int { //distance between notes
        switch self {
        case .crochet: return 2
        case .minim: return 4
        case .quaver: return 1
        }
    }
}

enum NotePitch {
        case c
        case d
        case e
        case f
        case g
        case a
        case b
    }

//private func calculatePitch(from yPosition: CGFloat) -> NotePitch {
//       switch yPosition {
//       case 24: return .d
//       case 24: return .d
//       // Default or closest pitch
//       }
//   }





