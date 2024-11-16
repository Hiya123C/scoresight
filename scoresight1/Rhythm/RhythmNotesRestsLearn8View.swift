//
//  RhythmNotesRestsLearn8View.swift
//  scoresight1
//
//  Created by T Krobot on 12/11/24.
//

import SwiftUI
import AVFoundation

struct RhythmNotesRestsLearn8View: View {
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
                    Image("semiquaver rest")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .trailing) {
                        Text("this is a")
                            .font(.system(size: 40))
                        Text("semiquaver")
                            .font(.system(size: 80))
                            .bold()
                        Text("rest")
                            .font(.system(size: 40))
                    }
                }

                HStack {
                    NavigationLink(destination: RhythmNotesRestsLearn7View()) {
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
                        speakText("This is a semiquaver rest. Similar to the semiquaver note, it is one eighth of a beat long. However, instead of holding the note, you don't play for an eighth of a beat, basically a short time.")
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 20)

                    NavigationLink(destination: RhythmNotesRestsLearn9View()) {
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
                speakText("This is a semiquaver rest. Similar to the semiquaver note, it is one eighth of a beat long. However, instead of holding the note, you don't play for an eighth of a beat, basically a short time.")
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
    RhythmNotesRestsLearn8View()
}
