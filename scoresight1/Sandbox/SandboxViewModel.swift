//

import SwiftUI

class SandboxViewModel: ObservableObject {
    @Published var noteImages: [String] = ["crochet 1", "crochet 1", "crochet 1", "crochet 1"]
    @Published var notes: [Note] = [.init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0)]
    @Published var selectedRestIndex: Int? = nil

    
    
    func resetNotes() {
        noteImages = ["crochet", "crochet", "crochet", "crochet"]
        notes = [.init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0)]
    }
    
    func replaceNote(with noteLength: String) {
        switch noteLength {
        case "minim":
            noteImages = ["minim 1","minim 1",] //all minim ?
            notes = [.init(position: .zero, NoteLength: .minim, pitch: 0), .init(position: .zero, NoteLength: .minim, pitch: 0)]
        case "quaver":
            noteImages = ["quaver 2", "quaver 2", "quaver 2","quaver 2","quaver 2","quaver 2","quaver 2","quaver 2"]
            notes = [.init(position: .zero, NoteLength: .quaver, pitch: 0), .init(position: .zero, NoteLength: .quaver, pitch: 0), .init(position: .zero, NoteLength: .quaver, pitch: 0), .init(position: .zero, NoteLength: .quaver, pitch: 0), .init(position: .zero, NoteLength: .quaver, pitch: 0), .init(position: .zero, NoteLength: .quaver, pitch: 0), .init(position: .zero, NoteLength: .quaver, pitch: 0), .init(position: .zero, NoteLength: .quaver, pitch: 0)]
        default:
            noteImages = ["crochet 1", "crochet 1","crochet 1","crochet 1"]
            notes = [.init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0), .init(position: .zero, NoteLength: .crochet, pitch: 0)]
        }
    }
}
  
    
    
   
