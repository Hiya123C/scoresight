import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct ArticulationsOrnamentsLearn2View: View {
    @State private var isPlayingAudio = false
    @State private var audioPlayer: AVAudioPlayer?

    // Reusable description text
    private let narrationText = "This is a tenuto. It is used to sustain the note for its full value, with a slight emphasis, like so:"

    init() {
        synthesizer.delegate = SpeechDelegate1.shared
    }

    func playPiano() {
        guard let soundURL = Bundle.main.url(forResource: "tenuto", withExtension: "mp3") else {
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
                // Close Button
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

                // Image and Description
                HStack {
                    Image("tenuto")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .trailing) {
                        Text("this is a")
                            .font(.system(size: 40))
                        Text("tenuto")
                            .font(.system(size: 80))
                            .bold()
                    }
                }
                Spacer()

                // Buttons (Back, Replay Audio, Next)
                HStack {
                    NavigationLink {
                        ArticulationsOrnamentsLearnView()
                    } label: {
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
                        ArticulationsOrnamentsLearn3View()
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
                // Trigger speech and piano setup
                SpeechDelegate1.shared.onSpeechFinished = {
                    playPiano()
                }
                speakText(narrationText)
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
        utterance.rate = 0.5
        synthesizer.speak(utterance)
    }

    // Replay narration and audio
    private func replayAudio() {
        speakText(narrationText)
    }

    // Stop all audio
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
        audioPlayer?.stop()
        audioPlayer = nil
    }
}

class SpeechDelegate1: NSObject, AVSpeechSynthesizerDelegate {
    static let shared = SpeechDelegate1()
    
    var onSpeechFinished: (() -> Void)?
    
    private override init() {}

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        // Notify when speech ends
        onSpeechFinished?()
    }
}

#Preview {
    ArticulationsOrnamentsLearn2View()
}
