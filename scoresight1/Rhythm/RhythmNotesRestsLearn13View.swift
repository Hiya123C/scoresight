//
//  RhythmNotesRestsLearn13View.swift
//  scoresight1
//
//  Created by T Krobot on 12/11/24.
//

import SwiftUI
import AVFoundation

struct RhythmNotesRestsLearn13View: View {
    private let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        NavigationStack {
            VStack {
            HStack {
                    NavigationLink(destination: RhythmNotesRestsView()) {
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size: 50))
                    }
                    Spacer()
                }
                .padding()

                Spacer()
                HStack(spacing: 70) {
                    Image("duplet")
                        .resizable()
                        .scaledToFit()

                    VStack(alignment: .trailing, spacing: -10) {
                        Text("this is a")
                            .font(.system(size: 50))
                        Text("duplet")
                            .font(.system(size: 90))
                            .bold()
                    }
                }

                Spacer()
                HStack {
                    NavigationLink(destination: RhythmNotesRestsLearn12View()) {
                        Text("back")
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                            )
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }
                    Spacer()


                    Button(action: {
                        speakText("Here is an example of a duplet. You might see notes with the number 2 on top. For this example, there are 2 quavers. This means that 2 quavers have to be played in the span of a dotted crotchet.")
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .padding(.trailing, 20)
                    }

                    NavigationLink(destination: RhythmNotesRestsReviewView()) {
                        Text("next")
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                            )
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .navigationBarHidden(true)
            .onAppear {
                speakText("Here is an example of a duplet. You might see notes with the number 2 on top. For this example, there are 2 quavers. This means that 2 quavers have to be played in the span of a dotted crotchet.")
            }
            .onDisappear {
                stopSpeech()
            }
        }
        .navigationBarHidden(true)
    }

    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        synthesizer.speak(utterance)
    }

    private func stopSpeech() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    RhythmNotesRestsLearn13View()
}
