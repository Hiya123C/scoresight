//
//  TimeSignaturesLearn6View.swift
//  scoresight1
//
//  Created by T Krobot on 13/11/24.
//

import SwiftUI
import AVFoundation
private let synthesizer = AVSpeechSynthesizer()
struct TimeSignaturesLearn6View: View {
    @State private var topNumber: Int = 4
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    NavigationLink(destination: TimeSignaturesView()) {
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size: 50))
                    }
                    Spacer()
                }
                .padding(.top, 10)
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("\(topNumber)")
                            .font(.system(size: 90))
                            .fontWeight(.bold)
                        Text("4")
                            .font(.system(size: 90))
                            .fontWeight(.bold)
                    }
                    
                    ForEach(0..<topNumber, id: \.self) { _ in
                        Image("crochet")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 40)
                    }
                }
                
                Spacer()
                
                HStack {
                    NavigationLink(destination: TimeSignaturesLearn5View()) {
                        Text("back")
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if topNumber > 2 {
                            topNumber -= 1
                        }
                    }) {
                        Text("-")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                    }
                    
                    Button(action: {
                        if topNumber < 4 {
                            topNumber += 1
                        }
                    }) {
                        Text("+")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    Button(action: {
                        replayAudio()
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                    }
                    NavigationLink(destination: TimeSignaturesLearn7View()) {
                        Text("next")
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }
                }
                .padding()
            }
            .onAppear {
                speakText(" Find out how the bar changes when you press the plus and minus buttons! The limit is 2- 4")
            }
            .onDisappear {
                stopAudio()
            }
            .padding()
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
        speakText(" Find out how the bar changes when you press the plus and minus buttons! The limit is 2 to 4")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    TimeSignaturesLearn6View()
}
