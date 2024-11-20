//

import SwiftUI
import AVFoundation

struct SheetMusicOrganisationLearn3View: View {
    @State private var synthesizer = AVSpeechSynthesizer()
    @State private var isSpeaking = false
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented: Bool
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
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
                VStack {
                    HStack(alignment: .center) {
                        Image("clefs")
                            .resizable()
                            .scaledToFit()
                        VStack(alignment: .leading) {
                            Text("(RH)")
                                .font(.system(size: 40))
                            Text("Treble")
                                .font(.system(size: 40))
                                .bold()
                            Spacer()
                            Text("(LH)")
                                .font(.system(size: 40))
                            Text("Bass")
                                .font(.system(size: 40))
                                .bold()
                        }
                    }
                }
                .frame(maxHeight: .infinity)
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
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.system(size: 25))
                        .padding(.trailing, 20)
                        .foregroundStyle(.black)
                        .onTapGesture {
                            if isSpeaking {
                                stopSpeech()
                            } else {
                                speakText("When playing a piano, the right hand plays the treble clef while the left hand plays the bass clef.")
                            }
                            isSpeaking.toggle()
                        }
                    NavigationLink {
                        SheetMusicOrganisationLearn4View(isPresented:$isPresented)
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
            .onAppear {
                speakText("When playing a piano, the right hand plays the treble clef while the left hand plays the bass clef.")
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
    @Previewable @State var isShowing = false
    SheetMusicOrganisationLearn2View(isPresented: $isShowing)
}
