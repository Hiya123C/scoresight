//
//  KeySignaturesAccidentalsLearn12View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct KeySignaturesAccidentalsLearn12View: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented: Bool
    var body: some View {
        NavigationStack {
            VStack {
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
                VStack {
                    HStack {
                        Text("this is a")
                            .font(.system(size: 40))
                        Text("semitone")
                            .font(.system(size: 80))
                            .bold()
                    }
                    Image("semitone")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(1.3)
                }
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
                        KeySignaturesAccidentalsLearn13View(isPresented:$isPresented)
                    } label:{
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
                .padding(.horizontal)
            }
            .onAppear {
                speakText("This is a semitone, sometimes called a half tone or half step. It is the distance from a white key to a neighbouring black key on the piano keyboard.")
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
        speakText("This is a semitone, sometimes called a half tone or half step. It is the distance from a white key to a neighbouring black key on the piano keyboard.")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    @Previewable @State var isShowing = false
   KeySignaturesAccidentalsLearn12View(isPresented: $isShowing)
}
