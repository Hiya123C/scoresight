//
//  RhythmNotesRestsLearn11View.swift
//  scoresight1
//
//  Created by T Krobot on 12/11/24.
//

import SwiftUI
import AVFoundation

struct RhythmNotesRestsLearn11View: View {
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

                HStack(alignment: .top, spacing: 10) {
                    VStack {
                        Image("dotted semibreve rest")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 80)
                        Image("dotted semibreve")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 130)
                    }
                    VStack {
                        Image("dotted minim rest")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 90) // Limit max height
                        Image("dotted minim")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 140) // Limit max height
                    }
                    VStack {
                        Image("dotted crochet rest")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 130) // Limit max height
                        Image("dotted crochet")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 100) // Limit max height
                    }
                    VStack {
                        Image("dotted quaver rest")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 100) // Limit max height
                        Image("dotted quaver")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 100) // Limit max height
                    }
                }

                Spacer()
                HStack {
                    NavigationLink(destination: RhythmNotesRestsLearn10View()) {
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
                        speakText("Sometimes there are notes with a dot next to them. They are known as dotted notes, and the dot represents that the value of the note is the current value added with half of its value.")
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .padding(.trailing, 20)
                    }

                    NavigationLink(destination: RhythmNotesRestsLearn12View()) {
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
                speakText("Sometimes there are notes with a dot next to them. They are known as dotted notes, and the dot represents that the value of the note is the current value added with half of its value.")
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
        utterance.rate = 0.5
        synthesizer.speak(utterance)
    }

    private func stopSpeech() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    RhythmNotesRestsLearn11View()
}
