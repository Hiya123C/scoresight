//

import AVFoundation

class AudioManager: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    
    // Function to play a sound based on the note
    func playSound(for note: NotePitch, duration: Int) {
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + duration) { //delay end of note
//                }
        
        let noteName: String
        switch note {
        case .d:
            noteName = "D3"
        case .e:
            noteName = "E3"
        case .f:
            noteName = "F3"
        case .g:
            noteName = "G3"
        case .a:
            noteName = "A3"
        case .b:
            noteName = "B3"
        case .c:
            noteName = "C4"
        case .D:
            noteName = "D4"
        case .E:
            noteName = "E4"
        case .F:
            noteName = "F4"
        case .G:
            noteName = "G4"
        }
        
        // Get the file URL for the audio file
        if let url = Bundle.main.url(forResource: noteName, withExtension: "mp3") {
            do {
                // Create the audio player
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error playing sound for note \(noteName): \(error)")
            }
        }
    }
}
