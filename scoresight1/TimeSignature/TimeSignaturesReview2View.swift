//
//  TimeSignaturesReview2View.swift
//  scoresight1
//
//  Created by Crystal on 15/11/24.
//

import SwiftUI
import AVFoundation

struct TimeSignaturesReview2View: View {
    @State private var selectedAnswer: String? = nil
    @State private var correctAnswer: Bool = false
    @State private var wrongAnswer: Bool = false
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        NavigationView {
            VStack {
                    VStack {
                        HStack {
                            NavigationLink {
                                TimeSignaturesView()
                            } label: {
                                Image(systemName: "x.circle")
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.black, .white)
                                    .font(.system(size: 50))
                            }
                            Spacer()
                        }
                        .padding(.top, 10)
                        
                        Spacer()
                        
                        Text("What is the correct time signature for the following rhythm played in the audio?")
                            .font(.system(size: 30))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        HStack(spacing: 20) {
                            AnswerButton1(imageName: "24", isSelected: selectedAnswer == "24", isCorrect: false) {
                                selectedAnswer = "24"
                                correctAnswer = false
                                wrongAnswer = true
                            }
                            AnswerButton1(imageName: "34", isSelected: selectedAnswer == "34", isCorrect: true) {
                                selectedAnswer = "34"
                                correctAnswer = true
                                wrongAnswer = false
                            }
                            AnswerButton1(imageName: "44", isSelected: selectedAnswer == "44", isCorrect: false) {
                                selectedAnswer = "44"
                                correctAnswer = false
                                wrongAnswer = true
                            }
                        }
                        
                        Spacer()
                        
                        ZStack {
                            if correctAnswer {
                                Text("Correct! The time signature is 3/4.")
                                    .font(.system(size: 20))
                                    .foregroundColor(.green)
                                    .padding(.top, 10)
                            }
                            if wrongAnswer {
                                Text("Wrong! Try again.")
                                    .font(.system(size: 20))
                                    .foregroundColor(.red)
                                    .padding(.top, 10)
                            }
                        }
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            NavigationLink {
                                TimeSignaturesReview3View()
                            } label: {
                                Button(action: playAudio) {
                                    Image(systemName: "speaker.wave.2.fill")
                                        .font(.system(size: 40))
                                        .padding(.trailing, 20)
                                }
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
                }
            .onDisappear {
                stopAudio()
            }
            .navigationBarBackButtonHidden(true)
            }
        .navigationBarBackButtonHidden(true)
        }
        
        private func playAudio() {
            guard let url = Bundle.main.url(forResource: "timesignaturesquestion1", withExtension: "m4a") else {
                print("Audio file not found")
                return
            }
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                print("Playing audio")
            } catch {
                print("Error playing audio: \(error.localizedDescription)")
            }
        }
        
        private func stopAudio() {
            if let player = audioPlayer {
                if player.isPlaying {
                    player.stop()
                    print("Audio stopped")
                } else {
                    print("Audio was not playing")
                }
                audioPlayer = nil
            } else {
                print("No audio player to stop")
            }
        }
    }
    
    struct AnswerButton1: View {
        let imageName: String
        let isSelected: Bool
        let isCorrect: Bool
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isSelected ? (isCorrect ? Color.green : Color.red) : Color.black, lineWidth: 3)
                    )
                    .foregroundColor(isSelected ? (isCorrect ? .green : .red) : .black)
            }
        }
    }

#Preview {
    TimeSignaturesReview2View()
}
