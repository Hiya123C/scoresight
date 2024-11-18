//
//  TimeSignaturesLearn2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI
import AVFoundation

struct TimeSignaturesLearnView: View {
    private let synthesizer = AVSpeechSynthesizer()
    
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented:Bool
    
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
                HStack (spacing: 100) {
                    Image("44")
                        .resizable()
                        .scaledToFit()
                    
                    VStack(alignment: .trailing, spacing: -10) {
                        Text("this is a")
                            .font(.system(size: 50))
                        Text("time")
                            .font(.system(size: 80))
                            .bold()
                        Text("signature")
                            .font(.system(size: 60))
                            .bold()
                    }
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button(action: {
                        replayAudio()
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .padding(.trailing, 10)
                    }
                    
                    NavigationLink(destination: TimeSignaturesLearn2View(isPresented:$isPresented)) {
                        Text("next")
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarHidden(true)
            .onAppear {
                speakText("This is the time signature 4,4. The number below determines the type of note value. In this case, 4 represents a crotchet.")
            }
            .onDisappear {
                stopAudio()
            }
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
    
    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        synthesizer.speak(utterance)
    }

    private func replayAudio() {
        speakText("This is the time signature 4,4. The number below determines the type of note value. In this case, 4 represents a crotchet.")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}
#Preview {
    @Previewable @State var isShowing = false
   TimeSignaturesLearnView(isPresented: $isShowing)
}
