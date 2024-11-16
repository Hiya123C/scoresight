//
//  RhythmNotesRestsLearn6View.swift
//  scoresight1
//
//  Created by T Krobot on 11/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct RhythmNotesRestsLearn6View: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {}) {
                        NavigationLink(destination: RhythmNotesRestsView()) {
                            Image(systemName: "x.circle")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .white)
                                .font(.system(size: 50))
                        }
                    }
                    Spacer()
                }
                .padding(.top)

                Spacer()
                HStack {
                    Image("quaver rest")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 200)

                    VStack(alignment: .leading, spacing: 5) {
                        Text("This is a")
                            .font(.system(size: 40))
                        Text("quaver rest")
                            .font(.system(size: 80))
                            .bold()
                    }
                }
                .padding()

                Spacer()

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
                    HStack {
                        Button(action: {
                            replayAudio()
                        }) {
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(.black)
                                .padding(.trailing, 10)
                        }
                        NavigationLink(destination: RhythmNotesRestsLearn7View()) {
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
                }
                .padding([.leading, .trailing, .bottom])
            }
            .navigationBarHidden(true)
            .onAppear {
                speakText("This is a quaver rest. Similar to the quaver note, it is half a beat long. However, instead of holding the note, you don’t play for half a beat.")
        }
        .navigationBarHidden(true)
                .onDisappear {
                    synthesizer.stopSpeaking(at: .immediate)
                }
        }
    }

    private func replayAudio() {
        speakText("This is a quaver rest. Similar to the quaver note, it is half a beat long. However, instead of holding the note, you don’t play for half a beat.")
    }

    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        synthesizer.speak(utterance)
    }
}

#Preview {
    RhythmNotesRestsLearn6View()
}
