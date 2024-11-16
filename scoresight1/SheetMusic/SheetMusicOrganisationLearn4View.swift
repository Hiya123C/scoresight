//

import SwiftUI
import AVFoundation

struct SheetMusicOrganisationLearn4View: View {
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
                        Image("flats")
                            .resizable()
                            .scaledToFit()
                        
                        VStack(alignment:.leading){
                            Text("these")
                                .font(.system(size: 40))
                            Text("could be")
                                .font(.system(size:40))
                            Text("flats")
                                .font(.system(size:80))
                                .bold()
                        }
                    }
                }
                .frame(maxHeight:.infinity)
                
                HStack{
                    NavigationLink{
                        SheetMusicOrganisationLearn3View()
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
                                speakText("There will also be key signatures, they could be flats")
                            }
                            isSpeaking.toggle()
                        }
                    
                    NavigationLink{
                        SheetMusicOrganisationLearn5View()
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
            speakText("There will also be key signatures, they could be flats")
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
    SheetMusicOrganisationLearn4View()
}
