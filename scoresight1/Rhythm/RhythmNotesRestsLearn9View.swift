//
//  RhythmNotesRestsLearn9View.swift
//  scoresight1
//
//  Created by T Krobot on 12/11/24.
//


import SwiftUI
import AVFoundation

struct RhythmNotesRestsLearn9View: View {
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
                    Image("demisemiquaver")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .trailing) {
                        Text("this is a")
                            .font(.system(size: 40))
                        Text("demisemiquaver")
                            .font(.system(size: 80))
                            .bold()
                        Text("note")
                            .font(.system(size: 40))
                    }
                }

                HStack {
                    NavigationLink(destination: RhythmNotesRestsLearn8View()) {
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

                    // Speaker Icon with Padding on the trailing side (20)
                    Button(action: {
                        speakText("This is a demisemiquaver note. It is one sixteenth of a beat long. A quaver consists of two semiquavers, and a semiquaver consists of two demisemiquavers.")
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .padding(.trailing, 20)
                    }

                    NavigationLink(destination: RhythmNotesRestsLearn10View()) {
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
                // Start speaking the text when the view appears
                speakText("This is a demisemiquaver note. It is one sixteenth of a beat long. A quaver consists of two semiquavers, and a semiquaver consists of two demisemiquavers.")
            }
            .onDisappear {
                // Stop the speech when the view disappears
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
    RhythmNotesRestsLearn9View()
}
