import SwiftUI

class SandboxViewModel: ObservableObject {
    @Published var selectedNote: String? // Track selected note
    @Published var lineProgress: [String] = [] // Track user-created line
    @Published var restImages: [String] = ["crochet rest", "crochet rest", "crochet rest", "crochet rest"] // Track rests
    
    func addNoteToLine(note: String) {
        lineProgress.append(note)
        selectedNote = note
    }
    
    func replaceRest(with newRest: String) {
        if let index = restImages.firstIndex(of: "crochet rest") {
            restImages[index] = newRest
        }
    }
}
