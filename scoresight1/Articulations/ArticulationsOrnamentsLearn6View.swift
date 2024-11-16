//
//  ArticulationsOrnamentsLearn6View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct ArticulationsOrnamentsLearn6View: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    NavigationLink{
                        ArticulationsOrnamentsView()
                    }label:{
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                
                HStack {
                    Image("fermata")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .trailing) {
                        Text("this is a")
                            .font(.system(size: 40))
                        Text("fermata")
                            .font(.system(size:80))
                            .bold()
                    }
                }
                HStack{
                    NavigationLink{
                        ArticulationsOrnamentsLearn5View()
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
                        ArticulationsOrnamentsLearn7View()
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
                speakText("this is a fermata. the note should be held longer than its actual number of beats like so:")
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
        utterance.rate = 0.5
        synthesizer.speak(utterance)
    }
    
    private func replayAudio() {
        speakText("this is a fermata. the note should be held longer than its actual number of beats like so:")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}


#Preview {
    ArticulationsOrnamentsLearn6View()
}
