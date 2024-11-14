//

import SwiftUI

class SandboxViewModel: ObservableObject {
    @Published var noteImages: [String] = ["crochet", "crochet", "crochet", "crochet"]
    @Published var notes: [Note] = []
    @Published var selectedRestIndex: Int? = nil

    func resetNotes() {
        noteImages = ["crochet", "crochet", "crochet", "crochet"]
    }
    
    func toggleSelectNote(at index: Int) {
            if selectedRestIndex == index {
                selectedRestIndex = nil // Deselect if it's already selected
            } else {
                selectedRestIndex = index
            }
        }
    
    func replaceNote(with noteLength: String) {
        switch noteLength {
        case "minim":
            noteImages = ["minim","minim",] //all minim ?
        case "quaver":
            noteImages = ["quaver", "quaver", "quaver","quaver","quaver","quaver","quaver","quaver"]
        default:
            noteImages = ["crochet", "crochet","crochet","crochet"]
        }
    }
    //    func addNote(type: String, at position: CGPoint) {
    //        let newNote = Note(position: position, type: type, pitch: calculatePitch(for: position))
    //        notes.append(newNote)
    //    }

    func updatePitch(for note: Note, at position: CGPoint) -> Note {
        var updatedNote = note
        updatedNote.position = position
        updatedNote.pitch = calculatePitch(for: position)
        return updatedNote
    }
    
    private func calculatePitch(for position: CGPoint) -> Int {
        return Int(position.y / 10)
    }
}
  
    
    
   
