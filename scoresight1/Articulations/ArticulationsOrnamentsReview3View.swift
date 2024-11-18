//
//  ArticulationsOrnamentsReview3View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 14/11/24.
//

import SwiftUI
import AVFoundation

struct ArticulationsOrnamentsReview3View: View {
    
    @State private var selectedAnswer: String? = nil
    @State private var correctAnswer: Bool = false
    @State private var wrongAnswer: Bool = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlayingAudio = false
    @Binding var isPresented: Bool
    
    func playAudio() {
        guard let soundURL = Bundle.main.url(forResource: "portato", withExtension: "mp3") else {
            print("Audio cannot find.")
            return
        }
        do {
            if audioPlayer == nil {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = 0
            }
            
            if let player = audioPlayer {
                if isPlayingAudio {
                    player.pause()
                } else {
                    player.play()
                }
                isPlayingAudio.toggle()
            }
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    HStack {
                        Button(action:{
                            isPresented = false
                        }){
                            Image(systemName: "x.circle")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .white)
                                .font(.system(size:50))
                        }
                        Spacer()
                    }
                    Spacer()
                    
                    VStack {
                        Text("What is the articulation being played in the audio?")
                            .font(.system(size: 40))
                        
                        HStack {
                            Spacer()
                            AnswerButton(label: "legato", isSelected: selectedAnswer == "legato", isCorrect: false) {
                                selectedAnswer = "legato"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "portato", isSelected: selectedAnswer == "portato", isCorrect: true) {
                                selectedAnswer = "portato"
                                correctAnswer = true
                                wrongAnswer = false
                                print("correct")
                            }
                            Spacer()
                            AnswerButton(label: "marcato", isSelected: selectedAnswer == "marcato", isCorrect: false) {
                                selectedAnswer = "marcato"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            
                        }
                    }
                    
                    Spacer()
                    ZStack {
                        HStack {
                            Spacer()
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.system(size: 25))
                                .padding(.trailing, 20)
                                .foregroundStyle(.black)
                                .onTapGesture {
                                    playAudio()
                                }
                            
                            NavigationLink {
                                ArticulationsOrnamentsReview4View(isPresented:$isPresented)
                            } label: {
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
                        if correctAnswer {
                            Text("Correct! The articulation played is portato.")
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
                }
            }
        }
        .onAppear{
            playAudio()
        }
        .onDisappear {
            stopAudio()
        }
        .navigationBarBackButtonHidden(true)
    }
    private func stopAudio() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}

#Preview {
    @Previewable @State var isShowing = false
  ArticulationsOrnamentsReview3View(isPresented: $isShowing)
}
