//

import Foundation

struct Note: Identifiable {
    let id = UUID()
    var position: CGPoint
    var NoteLength: NoteLength
    var pitch: NotePitch{
        switch position.y {
        case 25.6: return .d
        case 12.8: return .e
        case 0: return .f
        case -12.8: return .g
        case -25.6: return .a
        case -38.4: return .b
        case -51.2: return .c
        case -64: return .D
        case -76.8: return .E
        case -89.6: return .F
        case -102.2: return .G //why cant detrec ahh
        default: return .b // default pitch
        }
    }
    var flipped: Bool{
        position.y <= -46
    }
    
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
    var timeMultiplier: Double {
            switch self {
            case .crochet: return 1
            case .minim: return 2
            case .quaver: return 0.5
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





