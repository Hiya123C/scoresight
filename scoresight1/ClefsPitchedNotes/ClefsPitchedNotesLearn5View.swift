//
//  ClefsPitchedNotesLearn3View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct ClefsPitchedNotesLearn5View: View {
    var body: some View {
        VStack {
            HStack {
                NavigationLink{
                    ClefsPitchedNotesView()
                }label:{
                    Image(systemName: "x.circle")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .font(.system(size:50))
                }
                Spacer()
            }
            
            HStack {
                Image("alto")
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .trailing) {
                    Text("this is an")
                        .font(.system(size: 40))
                    Text("alto")
                        .font(.system(size:80))
                        .bold()
                    Text("clef")
                        .font(.system(size: 40))
                }
                // ask about separating the image and text
            }
            HStack{
                NavigationLink{
                    ClefsPitchedNotesLearn4View()
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
                    ClefsPitchedNotesLearn6View()
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
            .padding(.horizontal)
        }
        .onAppear {
            speakText("This is an alto clef. it is usually used as a clef for instruments such as viola, alto trombone and mandola.")
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
        speakText("This is an alto clef. it is usually used as a clef for instruments such as viola, alto trombone and mandola.")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    ClefsPitchedNotesLearn5View()
}
