//

import SwiftUI

class SandboxViewModel: ObservableObject {
    @Published var noteImages: [String] = ["crochet 1", "crochet 1", "crochet 1", "crochet 1"]
    @Published var notes: [Note] = [.init(position: .zero, NoteLength: .crochet), .init(position: .zero, NoteLength: .crochet), .init(position: .zero, NoteLength: .crochet), .init(position: .zero, NoteLength: .crochet)]
    @Published var selectedRestIndex: Int? = nil

    
    
    func resetNotes() {
        noteImages = ["crochet 1", "crochet 1", "crochet 1", "crochet 1"]
        notes = [.init(position: .zero, NoteLength: .crochet), .init(position: .zero, NoteLength: .crochet), .init(position: .zero, NoteLength: .crochet), .init(position: .zero, NoteLength: .crochet)]
    }
    
    func replaceNote(with noteLength: String) {
        switch noteLength {
        case "minim":
            noteImages = ["minim 1","minim 1",] //all minim ?
            notes = [.init(position: .zero, NoteLength: .minim), .init(position: .zero, NoteLength: .minim)]
        case "quaver":
            noteImages = ["quaver 2", "quaver 2", "quaver 2","quaver 2","quaver 2","quaver 2","quaver 2","quaver 2"]
            notes = [.init(position: .zero, NoteLength: .quaver), .init(position: .zero, NoteLength: .quaver), .init(position: .zero, NoteLength: .quaver), .init(position: .zero, NoteLength: .quaver), .init(position: .zero, NoteLength: .quaver), .init(position: .zero, NoteLength: .quaver), .init(position: .zero, NoteLength: .quaver), .init(position: .zero, NoteLength: .quaver)]
        default:
            noteImages = ["crochet 1", "crochet 1","crochet 1","crochet 1"]
            notes = [.init(position: .zero, NoteLength: .crochet), .init(position: .zero, NoteLength: .crochet), .init(position: .zero, NoteLength: .crochet), .init(position: .zero, NoteLength: .crochet)]
        }
    }
}
  
    
    
   
