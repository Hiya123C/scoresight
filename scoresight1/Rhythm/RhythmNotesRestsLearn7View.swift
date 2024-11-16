//
//  RhythmNotesRestsLearn7View.swift
//  scoresight1
//
//  Created by T Krobot on 12/11/24.
//

import SwiftUI
import AVFoundation

struct RhythmNotesRestsLearn7View: View {
    private let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                    }) {
                        NavigationLink(destination: RhythmNotesRestsView()) {
                            Image(systemName: "x.circle")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .white)
                                .font(.system(size: 50))
                        }
                    }
                    Spacer()
                }
                
                HStack {
                    Image("semiquaver")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .trailing) {
                        Text("this is a")
                            .font(.system(size: 40))
                        Text("semiquaver")
                            .font(.system(size: 80))
                            .bold()
                        Text("note")
                            .font(.system(size: 40))
                    }
                }
                
                HStack {
                    NavigationLink(destination: RhythmNotesRestsLearn5View()) {
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
                        speakText("This is a semiquaver. It is one eighth of a beat. A quaver consists of two semiquavers.")
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 20)
                    
                    NavigationLink(destination: RhythmNotesRestsLearn8View()) {
                        Text("next")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
            .onAppear {
                speakText("This is a semiquaver. It is one eighth of a beat. A quaver consists of two semiquavers.")
            }
            .onDisappear {
                synthesizer.stopSpeaking(at: .immediate)
            }
        }
        .navigationBarHidden(true)
    }

    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        synthesizer.speak(utterance)
    }
}

#Preview {
    RhythmNotesRestsLearn7View()
}
