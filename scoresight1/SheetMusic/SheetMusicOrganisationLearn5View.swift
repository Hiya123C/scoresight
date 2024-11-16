//

import SwiftUI
import AVFoundation

struct SheetMusicOrganisationLearn5View: View {
    @State private var synthesizer = AVSpeechSynthesizer()
    @State private var isSpeaking = false
    
    var body: some View {
        VStack{
            NavigationStack{
                HStack{
                    NavigationLink{
                        SheetMusicOrganisationView()
                    } label:{
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                VStack{
                    HStack(alignment: .center){
                        Image("sharps")
                            .resizable()
                            .scaledToFit()
                        
                        VStack(alignment:.leading){
                            Text("or")
                                .font(.system(size: 40))
                            Text("sharps")
                                .font(.system(size:80))
                                .bold()
                        }
                    }
                }
                .frame(maxHeight:.infinity)
                
                HStack{
                    NavigationLink{
                        SheetMusicOrganisationLearn4View()
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
                                speakText("or could also be sharps")
                            }
                            isSpeaking.toggle()
                        }
                    
                    NavigationLink{
                        SheetMusicOrganisationLearn6View()
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
            speakText("or could also be sharps")
        }
        .onDisappear {
            stopSpeech()
        }
        .navigationBarBackButtonHidden(true)
    }
    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
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
    SheetMusicOrganisationLearn5View()
}
