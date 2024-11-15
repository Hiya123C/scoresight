//
//  ArticulationsOrnamentsLearn14View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct ArticulationsOrnamentsLearn14View: View {
    var body: some View {
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
                Image("acciacatura")
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .trailing) {
                    Text("this is an")
                        .font(.system(size: 40))
                    Text("acciacatura")
                        .font(.system(size:80))
                        .bold()
                }
            }
            HStack{
                NavigationLink{
                    ArticulationsOrnamentsLearn13View()
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
                    ArticulationsOrnamentsReviewView()
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
            speakText("this is an acciaccatura. The  tiny note is always a demisemiquaver and the big note is the remaining value, which is why it’s called a ‘crush note’. it is drawn with a slash. it is played like so:")
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
        speakText("this is an acciaccatura. The  tiny note is always a demisemiquaver and the big note is the remaining value, which is why it’s called a ‘crush note’. it is drawn with a slash. it is played like so:")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    ArticulationsOrnamentsLearn14View()
}
