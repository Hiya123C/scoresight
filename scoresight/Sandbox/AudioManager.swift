import AVFoundation

class AudioManager: ObservableObject {
    private var audioPlayers: [AVAudioPlayer] = []
    
    func playSound(for note: NotePitch, duration: Double) {
        let noteName: String
        switch note {
        case .d: noteName = "D3"
        case .e: noteName = "E3"
        case .f: noteName = "F3"
        case .g: noteName = "G3"
        case .a: noteName = "A3"
        case .b: noteName = "B3"
        case .c: noteName = "C4"
        case .D: noteName = "D4"
        case .E: noteName = "E4"
        case .F: noteName = "F4"
        case .G: noteName = "G4"
        }
        
        // Locate the audio file for the note
        guard let url = Bundle.main.url(forResource: noteName, withExtension: "mp3") else {
            print("Error: Could not find audio file for note \(noteName).")
            return
        }
        
        do {
            
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            audioPlayers.append(audioPlayer)
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                audioPlayer.stop()
                self.cleanUp(audioPlayer)
            }
        } catch {
            print("Error playing sound for note \(noteName): \(error)")
        }
    }
    
 
    private func cleanUp(_ player: AVAudioPlayer) {
        if let index = audioPlayers.firstIndex(of: player) {
            audioPlayers.remove(at: index)
        }
    }
}
