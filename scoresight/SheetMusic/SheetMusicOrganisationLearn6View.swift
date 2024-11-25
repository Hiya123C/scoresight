//

import SwiftUI
import AVFoundation

struct SheetMusicOrganisationLearn6View: View {
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
                
                VStack{
                    HStack(alignment: .center){
                        Image("time signature")
                            .resizable()
                            .scaledToFit()
                        
                        VStack(alignment:.leading){
                            Text("this is a")
                                .font(.system(size: 40))
                            Text("time")
                                .font(.system(size:60))
                                .bold()
                            Text("signature")
                                .font(.system(size:60))
                                .bold()
                        }
                    }
                }
                .frame(maxHeight:.infinity)
                
                HStack{
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
                                speakText("On top of that, there are time signatures too.")
                            }
                            isSpeaking.toggle()
                        }
                    
                    NavigationLink{
                        SheetMusicOrganisationLearn7View(isPresented:$isPresented)
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
            
        }
        .onAppear {
            speakText("On top of that, there are time signatures too.")
        }
        .onDisappear {
            stopSpeech()
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
}

#Preview {
    @Previewable @State var isShowing = false
    SheetMusicOrganisationLearn6View(isPresented: $isShowing)
}