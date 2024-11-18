import SwiftUI
import AVFoundation

struct SheetMusicOrganisationLearn8View: View {
    @State private var synthesizer = AVSpeechSynthesizer()
    @State private var isSpeaking = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlayingAudio = false

    func playAudio() {
        guard let soundURL = Bundle.main.url(forResource: "endsign", withExtension: "mp3") else {
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
        VStack {
            NavigationStack {
                HStack {
                    NavigationLink {
                        SheetMusicOrganisationView()
                    } label: {
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size: 50))
                    }
                    Spacer()
                }
                VStack {
                    Spacer()
                    HStack {
                        Image("endsign")
                            .resizable()
                            .scaledToFit()
                        
                        Button(action: {
                            playAudio()
                        }) {
                            Image(systemName: isPlayingAudio ? "pause.circle" : "play.circle")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .black)
                                .font(.system(size: 50))
                        }
                    }
                    Spacer()
                    
                    HStack(alignment: .center) {
                        Spacer()
                        Text("this is an")
                            .font(.system(size: 40))
                        Text("endsign")
                            .font(.system(size: 60))
                            .bold()
                    }
                }
                .frame(maxHeight: .infinity)
                
                HStack {
                    NavigationLink {
                        SheetMusicOrganisationLearn7View()
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
                    
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.system(size: 25))
                        .padding(.trailing, 20)
                        .foregroundStyle(.black)
                        .onTapGesture {
                            if isSpeaking {
                                stopSpeech()
                            } else {
                                speakText("At the end of each piece or song, there will be an end sign.")
                            }
                            isSpeaking.toggle()
                        }
                    
                    NavigationLink {
                        SheetMusicOrganisationLearn9View()
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
            }
        }
        .onAppear {
            speakText("At the end of each piece or song, there will be an end sign.")
        }
        .onDisappear {
            stopSpeech()
            stopAudio()
        }
        .navigationBarBackButtonHidden(true)
    }

    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        synthesizer.speak(utterance)
    }

    private func stopSpeech() {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
        isSpeaking = false
    }

    private func stopAudio() {
        audioPlayer?.stop()
        audioPlayer = nil
        isPlayingAudio = false
    }
}


#Preview {
    SheetMusicOrganisationLearn8View()
}
