//

import Foundation

struct Note: Identifiable {
    let id = UUID()
    var position: CGPoint
    var NoteLength: NoteLength
    var pitch: Int
    
    // Determine the pitch based on the position.y value
    func notePitch(from positionY: CGFloat) -> NotePitch {
        switch positionY {
        case 24: return .d
        case 12: return .e
        case 0: return .f
        case -12: return .g
        case -24: return .a
        case -36: return .b
        case -48: return .c
        case -60: return .D
        case -72: return .E
        case -84: return .F
        case -96: return .G
        default: return .b // default pitch
        }
    }
}

enum NoteLength {
    case crochet
    case minim
    case quaver
    
    var lengthMultiplier: Int {
        switch self {
        case .crochet: return 2
        case .minim: return 4
        case .quaver: return 1
        }
    }
    var timeMultiplier: Int {
            switch self {
            case .crochet: return 2
            case .minim: return 4
            case .quaver: return 1
            }
        }
}

enum NotePitch {
    case d, e, f, g, a, b, c, D, E, F, G
    
    var pitchValue: Int {
        switch self {
        case .d: return 24
        case .e: return 12
        case .f: return 0
        case .g: return -12
        case .a: return -24
        case .b: return -36
        case .c: return -48
        case .D: return -60
        case .E: return -72
        case .F: return -84
        case .G: return -96
        }
    }
}


    
//     static func notePitch(from yPosition: CGFloat) -> NotePitch {
//        switch yPosition {
//        case 24: return .d
//        case 12: return .e
//        case 0: return .f
//        case -12: return .g
//        case -24: return .a
//        case -36: return .b
//        case -48: return .c
//        case -60: return .D
//        case -72: return .E
//        case -84: return .F
//        case -96: return .G
//        default: return.b
//            
//        }
//    }





