//

import SwiftUI

class SandboxViewModel: ObservableObject {
    @Published var restImages: [String] = ["crochet rest", "crochet rest", "crochet rest", "crochet rest"]
    @Published var notes: [Note] = []
    @Published var selectedRestIndex: Int? = nil // Track selected rest index

    func resetRests() {
        restImages = ["crochet rest", "crochet rest", "crochet rest", "crochet rest"]
    }

    func convertSelectedRest(to noteType: String, at index: Int?) {
        guard let index = index, index < restImages.count else { return }

        switch noteType {
        case "minim":
            restImages.replaceSubrange(index..<min(index+2, restImages.count), with: ["minim rest"])
        case "quaver":
            restImages.replaceSubrange(index..<index+1, with: ["quaver rest", "quaver rest"])
        case "crochet":
            restImages[index] = "crochet rest"
        default:
            break
        }
    }
    
    func toggleSelectRest(at index: Int) {
        if selectedRestIndex == index {
            selectedRestIndex = nil // Deselect if it's already selected
        } else {
            selectedRestIndex = index
        }
    }

    func replaceSelectedRest(with noteLength: String) {
        guard let index = selectedRestIndex, index < restImages.count else { return }
        
        switch noteLength {
        case "quaver":
            // Replace one crochet rest with two quaver rests
            restImages.remove(at: index)
            restImages.insert(contentsOf: ["quaver rest", "quaver rest"], at: index)
        case "minim":
            // Replace two adjacent crochet rests with one minim rest, if possible
            if index + 1 < restImages.count {
                restImages.remove(at: index)
                restImages.remove(at: index) // Remove the next crochet rest too
                restImages.insert("minim rest", at: index)
            }
        default:
            // Reset to default state with crochet rests
            restImages = ["crochet rest", "crochet rest", "crochet rest", "crochet rest"]
        }
        
        selectedRestIndex = nil
    }
    
    
//    func replaceRest(with noteLength: String) {
//        switch noteLength {
//        case "minim":
//            restImages = ["minim rest","minim rest",] //all minim ?
//        case "quaver":
//            restImages = ["quaver rest", "quaver rest", "quaver rest","quaver rest","quaver rest","quaver rest","quaver rest","quaver rest"]
//        default:
//            restImages = ["crochet rest", "crochet rest","crochet rest","crochet rest"]
//        }
//    }
    //    func addNote(type: String, at position: CGPoint) {
    //        let newNote = Note(position: position, type: type, pitch: calculatePitch(for: position))
    //        notes.append(newNote)
    //    }
    
    func beatChange(with noteBeat: String) {
        switch noteBeat {
        case "note":
            restImages = ["crochet", "crochet", "crochet", "crochet"]
        default:
            restImages = ["crochet rest", "crochet rest", "crochet rest", "crochet rest"]
        }
    }
    
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
  
    
    
   
