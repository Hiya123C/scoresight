//
//  KeySignaturesAccidentalsLearnView.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct KeySignaturesAccidentalsLearnView: View {
    var body: some View {
        VStack {
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
            
            HStack {
                Image("sharp")
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .trailing) {
                    Text("this is a")
                        .font(.system(size: 40))
                    Text("sharp")
                        .font(.system(size:80))
                        .bold()
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    replayAudio()
                }) {
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                }
                NavigationLink{
                    KeySignaturesAccidentalsLearn2View()
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
            speakText("This is a sharp. it a sign that indicates a note is played higher in pitch, by a semitone or half step.")
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
        speakText("This is a sharp. it a sign that indicates a note is played higher in pitch, by a semitone or half step.")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    KeySignaturesAccidentalsLearnView()
}
