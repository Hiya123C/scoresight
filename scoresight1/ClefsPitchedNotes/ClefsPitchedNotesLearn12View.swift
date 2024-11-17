//** image resizing

import SwiftUI
import AVFoundation

struct ClefsPitchedNotesLearn12View: View {
    
    @State private var isSpeaking = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlayingAudio = false
    
    func playAudio() {
        guard let soundURL = Bundle.main.url(forResource: "treblepitched", withExtension: "mp3") else {
            print("Audio cannot find.")
            return
        }
        do {
            if audioPlayer == nil {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = 0
            }
            
            if let player = audioPlayer {
                if isPlayingAudio {
                    player.pause()
                } else {
                    player.play()
                }
                isPlayingAudio.toggle()
            }
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    NavigationLink{
                        ClefsPitchedNotesView()
                    }label:{
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                Spacer()
                Text("pitched notes on the alto clef")
                    .font(.system(size: 40))
                Spacer()
                HStack{
                    Spacer()
                    Image("alto clef pitched notes")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(1.4)
                    Spacer()
                    Button(action: {
                        playAudio()
                    }) {
                        Image(systemName: isPlayingAudio ? "pause.circle" : "play.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .black)
                            .font(.system(size: 50))
                    }
                    Spacer()
                }
                
                HStack{
                    NavigationLink{
                        ClefsPitchedNotesLearn11View()
                    }label:{
                        Text("back")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width:100,height:50)
                                
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                        Spacer()
                        
                    }
//                    Button(action: {
//                        playAudio()
//                    }) {
//                        Image(systemName: "speaker.wave.2.fill")
//                            .font(.system(size: 30))
//                            .foregroundStyle(.black)
//                    }
                    .padding()
                    NavigationLink{
                        ClefsPitchedNotesLearn13View()
                    }label:{
                        Text("next")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width:100,height:50)
                                
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                        
                        
                    }
                }
            }
            .onDisappear {
                stopAudio()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    private func stopAudio() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}

#Preview {
    ClefsPitchedNotesLearn12View()
}
