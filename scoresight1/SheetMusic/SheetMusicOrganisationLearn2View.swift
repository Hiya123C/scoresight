//

import SwiftUI
import AVFoundation

struct SheetMusicOrganisationLearn2View: View {
    private let synthesizer = AVSpeechSynthesizer()
    @State private var isSpeaking = false
    
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
                    HStack(alignment: .center) {
                        Image("clefs")
                            .resizable()
                            .scaledToFit()
                        
                        VStack {
                            Text("these are")
                                .font(.system(size: 40))
                            Text("clefs")
                                .font(.system(size: 80))
                                .bold()
                        }
                    }
                }
                .frame(maxHeight: .infinity)
                
                HStack {
                    NavigationLink {
                        SheetMusicOrganisationLearnView()
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
                    
                    NavigationLink {
                        SheetMusicOrganisationLearn3View()
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
                                        speakText("In every first bar of a line, there are clefs.")
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
                speakText("In every first bar of a line, there are clefs.")
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
    SheetMusicOrganisationLearn2View()
}
