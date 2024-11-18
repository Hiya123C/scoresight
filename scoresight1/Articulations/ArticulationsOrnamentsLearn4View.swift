import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct ArticulationsOrnamentsLearn4View: View {
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlayingAudio = false
    
    func playAudio() {
        guard let soundURL = Bundle.main.url(forResource: "turn", withExtension: "mp3") else {
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
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented: Bool
    var body: some View {
        NavigationStack {
            VStack {
                // Close Button
                HStack {
                    Button(action:{
                        isPresented = false
                    }){
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                Spacer()

                // Image and Description
                HStack {
                    Image("turn")
                        .resizable()
                        .scaledToFit()
                    Button(action: {
                        playAudio()
                    }) {
                        Image(systemName: isPlayingAudio ? "pause.circle" : "play.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .black)
                            .font(.system(size: 50))
                            .padding(50)
                    }
                    VStack(alignment: .trailing) {
                        Text("this is a")
                            .font(.system(size: 40))
                        Text("turn")
                            .font(.system(size: 80))
                            .bold()
                    }
                }
                Spacer()

                HStack {
                    Button(action:{
                        dismiss()
                    }){
                        Text("back")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                    Spacer()
                    Button(action: {
                        replayAudio()
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                    }
                    .padding()
                    NavigationLink {
                        ArticulationsOrnamentsLearn5View(isPresented:$isPresented)
                    } label: {
                        Text("next")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                }
                .padding(.horizontal)
            }
            .onAppear {
                speakText("this is a turn and an inverted turn (the one with the line), and how the note looks like written out. it usually has four notes and ends at the ‘core’ note which is the note that is displayed.")
            }
            .onDisappear {
                stopAudio()
            }
            .navigationBarHidden(true)
        }
    }

    // Speak the given text
    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        synthesizer.speak(utterance)
    }

    // Replay narration and audio
    private func replayAudio() {
        speakText("this is a turn and an inverted turn (the one with the line), and how the note looks like written out. it usually has four notes and ends at the ‘core’ note which is the note that is displayed.")
    }

    // Stop all audio
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
        audioPlayer?.stop()
        audioPlayer = nil
    }
}

#Preview {
    @Previewable @State var isShowing = false
  ArticulationsOrnamentsLearn4View(isPresented: $isShowing)
}
