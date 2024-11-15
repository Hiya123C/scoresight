//
//  TimeSignaturesLearn3View.swift
//  scoresight1
//
//  Created by T Krobot on 13/11/24.
//


import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct TimeSignaturesLearn3View: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Button(action: {}) {
                        NavigationLink(destination: TimeSignaturesView()) {
                            Image(systemName: "x.circle")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .white)
                                .font(.system(size: 50))
                        }
                    }
                    Spacer()
                }
                .padding([.top, .leading])
                
                HStack {
                    Image("common time")
                        .resizable()
                        .scaledToFit()
                    
                    Image("four crochets")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                
                HStack {
                    NavigationLink(destination: TimeSignaturesLearn2View()) {
                        Text("back")
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                    Spacer()
                    
                    // Speaker icon button for replaying audio, placed next to "next" button
                    Button(action: {
                        replayAudio()
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                    }
                    
                    NavigationLink(destination: TimeSignaturesLearn4View()) {
                        Text("next")
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarHidden(true)
            .onAppear {
                speakText("The time signature with a C is called common time, but it also represents 44.")
            }
            .onDisappear {
                stopAudio()
            }
            .navigationBarHidden(true)
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
        speakText("The time signature with a C and a slash is called cut time, but it also represents 2/2.")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    TimeSignaturesLearn3View()
}
