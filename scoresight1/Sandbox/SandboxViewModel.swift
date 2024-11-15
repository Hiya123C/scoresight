//

import SwiftUI

class SandboxViewModel: ObservableObject {
    @Published var noteImages: [String] = ["crochet", "crochet", "crochet", "crochet"]
    @Published var notes: [Note] = [.init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0)]
    @Published var selectedRestIndex: Int? = nil

    func resetNotes() {
        noteImages = ["crochet", "crochet", "crochet", "crochet"]
        notes = [.init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0)]
    }
    
    func replaceNote(with noteLength: String) {
        switch noteLength {
        case "minim":
            noteImages = ["minim","minim",] //all minim ?
            notes = [.init(position: .zero, NoteLength: .minim, pitch: 0), .init(position: .zero, NoteLength: .minim, pitch: 0)]
        case "quaver":
            noteImages = ["quaver", "quaver", "quaver","quaver","quaver","quaver","quaver","quaver"]
            notes = [.init(position: .zero, NoteLength: .quaver, pitch: 0), .init(position: .zero, NoteLength: .quaver, pitch: 0), .init(position: .zero, NoteLength: .quaver, pitch: 0), .init(position: .zero, NoteLength: .quaver, pitch: 0), .init(position: .zero, NoteLength: .quaver, pitch: 0), .init(position: .zero, NoteLength: .quaver, pitch: 0), .init(position: .zero, NoteLength: .quaver, pitch: 0), .init(position: .zero, NoteLength: .quaver, pitch: 0)]
        default:
            noteImages = ["crochet", "crochet","crochet","crochet"]
            notes = [.init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0)]
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
  
    
    
   
