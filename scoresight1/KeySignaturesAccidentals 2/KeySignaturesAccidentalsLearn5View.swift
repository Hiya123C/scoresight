//
//  KeySignaturesAccidentalsLearn5View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct KeySignaturesAccidentalsLearn5View: View {
    var body: some View {
        HStack {
            NavigationLink{
                KeySignaturesAccidentalsView()
            } label:{
                Image(systemName: "x.circle")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.black, .white)
                    .font(.system(size:50))
            }
            Spacer()
        }
        Text("**F**ather **C**harles **G**oes\n**D**own **A**nd **E**nds **B**attle")
            .font(.system(size: 70))
            .frame(alignment: .center)
        HStack{
            NavigationLink{
                KeySignaturesAccidentalsLearn4View()
            } label:{
                Text("back")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 3)
                            .frame(width:100,height:50)
                        
                    )
                    .foregroundStyle(.black)
                    .font(.system(size: 25))
                Spacer()
                Button(action: {
                    replayAudio()
                }) {
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                }
            }
            NavigationLink{
                KeySignaturesAccidentalsLearn6View()
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
            .padding(.horizontal)
        }
        .onAppear {
            speakText("Key signatures always appear in the order F, C, G, D, A, E, B for sharps or vice versa for flats. their order can be remembered by the phrase “father charles goes down and ends battle”.")
        }
        .onDisappear {
            stopAudio()
        }
        .navigationBarHidden(true)
    }
    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        synthesizer.speak(utterance)
    }
    
    private func replayAudio() {
        speakText("key signatures always appear in the order F, C, G, D, A, E, B for sharps or vice versa for flats. their order can be remembered by the phrase “father charles goes down and ends battle”.")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    KeySignaturesAccidentalsLearn5View()
}
