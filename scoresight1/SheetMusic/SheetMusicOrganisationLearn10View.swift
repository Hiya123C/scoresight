//add play button

import SwiftUI
import AVFoundation

struct SheetMusicOrganisationLearn10View: View {
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
                Spacer()
                ZStack{
                    HStack{
                        Image("tempomarking")
                            .resizable()
                            .scaledToFit()
                    }
                    VStack{
                        HStack(alignment:.center){
                            Text("this is a")
                                .font(.system(size: 30))
                            Text("tempo marking")
                                .font(.system(size:40))
                                .bold()
                            Spacer()
                        }
                        Spacer()
                    }
                    //click play button to play audio**
                    
                }
                
                
                HStack{
                    NavigationLink{
                        SheetMusicOrganisationLearn9View()
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
                                speakText("with a repeat sign, the bars in to the left of the sign will be repeated once")
                            }
                            isSpeaking.toggle()
                        }
                    NavigationLink{
                        SheetMusicOrganisationReview1View()
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
            speakText("with a repeat sign, the bars in to the left of the sign will be repeated once")
        }
        .onDisappear {
            stopSpeech()
        }
        .frame(maxWidth:.infinity, maxHeight:.infinity)
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
    SheetMusicOrganisationLearn10View()
}
