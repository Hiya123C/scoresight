//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct ArticulationsOrnamentsLearnView: View {
    @State private var isPlayingAudio = false
    @State private var audioPlayer: AVAudioPlayer?

    @State private var shouldPlayPiano = false

    init() {
        synthesizer.delegate = SpeechDelegate.shared
    }

    func playPiano() {
        guard let soundURL = Bundle.main.url(forResource: "accent", withExtension: "mp3") else {
            print("Audio file not found.")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.numberOfLoops = 0
            audioPlayer?.play()
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    NavigationLink {
                        ArticulationsOrnamentsView()
                    } label: {
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size: 50))
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Image("accent")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .trailing) {
                        Text("this is an")
                            .font(.system(size: 40))
                        Text("accent")
                            .font(.system(size: 80))
                            .bold()
                    }
                }
                Spacer()
                HStack {
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
                        ArticulationsOrnamentsLearn2View()
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
                SpeechDelegate.shared.onSpeechFinished = {
                    shouldPlayPiano = true
                }
                speakText("This is an accent. It is used to emphasise the note you are playing like so:")
            }
            .onChange(of: shouldPlayPiano, initial: false) { oldValue, newValue in
                if newValue {
                    playPiano()
                    shouldPlayPiano = false
                }
            }
            .onDisappear {
                stopAudio()
            }
            .navigationBarHidden(true)
        }
    }
    
    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        synthesizer.speak(utterance)
    }
    
    private func replayAudio() {
        speakText("This is an accent. It is used to emphasise the note you are playing like so:")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
        audioPlayer?.stop()
        audioPlayer = nil
    }
}

class SpeechDelegate: NSObject, AVSpeechSynthesizerDelegate {
    static let shared = SpeechDelegate()
    
    var onSpeechFinished: (() -> Void)?
    
    private override init() {}
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        onSpeechFinished?()
    }
}

#Preview {
    ArticulationsOrnamentsLearnView()
}
