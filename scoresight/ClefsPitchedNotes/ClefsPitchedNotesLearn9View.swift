//
//  ClefsPitchedNotesLearn9View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct ClefsPitchedNotesLearn9View: View {
    @Binding var isPresented: Bool
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            HStack {
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
            Text("**C**ows **D**o **E**at **F**resh\n**G**rass **A**nd **B**arley")
                .font(.system(size: 70))
                .frame(alignment: .center)
            
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
                Button(action: {
                    replayAudio()
                }) {
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                }
                .padding()
                NavigationLink{
                    ClefsPitchedNotesLearn10View(isPresented:$isPresented)
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
                .padding(.horizontal)
            }
            .onAppear {
                speakText("There are seven different pitched notes. C, D, E, F, G, A and B. Their order of pitch can be remembered by the phrase “cows do eat fresh grass and barley”.")
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
        speakText("There are seven different pitched notes. C, D, E, F, G, A and B. Their order of pitch can be remembered by the phrase “cows do eat fresh grass and barley”.")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    @Previewable @State var isShowing = false
   ClefsPitchedNotesLearn9View(isPresented: $isShowing)
}
