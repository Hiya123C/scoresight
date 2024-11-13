//

import SwiftUI

class SandboxViewModel: ObservableObject {
    @Published var restImages: [String] = ["crochet rest", "crochet rest","crochet rest","crochet rest" ]
    @Published var notes: [Note] = []
    
    func replaceRest(with noteType: String) {
        switch noteType {
        case "minim":
            restImages = ["minim rest","crochet rest","crochet rest"]
        case "quaver":
            restImages = ["quaver rest", "quaver rest", "crochet rest","crochet rest","crochet rest"]
        default:
            restImages = ["crochet rest", "crochet rest","crochet rest","crochet rest"]
        }
    }
    func addNote(type: String, at position: CGPoint) {
        let newNote = Note(position: position, type: type, pitch: calculatePitch(for: position))
        notes.append(newNote)
    }
    
    func updatePitch(for note: Note, at position: CGPoint) -> Note {
        var updatedNote = note
        updatedNote.position = position
        updatedNote.pitch = calculatePitch(for: position)
        return updatedNote
    }
    
    private func calculatePitch(for position: CGPoint) -> Int {
        // Translate position into a pitch
        return Int(position.y / 10) // Example conversion
    }
}
