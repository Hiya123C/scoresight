//

import SwiftUI
import AVFoundation

struct SheetMusicOrganisationLearnView: View {
    private let synthesizer = AVSpeechSynthesizer()
    
    @State private var isSpeaking = false
    
    var body: some View {
        NavigationStack {
            VStack {
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
                    HStack(alignment: .center) {
                        Image("bar")
                            .resizable()
                            .scaledToFit()
                        VStack {
                            Text("this is a")
                                .font(.system(size: 40))
                            Text("bar")
                                .font(.system(size: 80))
                                .bold()
                        }
                    }
                }
                .frame(maxHeight: .infinity)
                
                HStack {
                    Spacer()
                    NavigationLink {
                        SheetMusicOrganisationLearn2View()
                    } label: {
                        HStack {
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.system(size: 25))
                                .padding(.trailing, 20)
                                .foregroundStyle(.black)
                                .onTapGesture {
                                    if isSpeaking {
                                        stopSpeech()
                                    } else {
                                        speakText("This is a bar. It is the basis of every musical score.")
                                    }
                                    isSpeaking.toggle()
                                }
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
                speakText("This is a bar. It is the basis of every musical score.")
            }
            .onDisappear {
                stopSpeech()
            }
            .navigationBarBackButtonHidden(true)
        }
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
}

#Preview {
    SheetMusicOrganisationLearnView()
}
