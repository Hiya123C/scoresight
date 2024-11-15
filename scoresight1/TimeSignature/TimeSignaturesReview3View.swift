//
//  TimeSignaturesReview3View.swift
//  scoresight1
//
//  Created by Crystal on 15/11/24.
//

import SwiftUI
import AVFoundation

struct TimeSignaturesReview3View: View {
    @State private var selectedAnswer: String? = nil
    @State private var correctAnswer: Bool = false
    @State private var wrongAnswer: Bool = false
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            NavigationStack {
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

                    Text("What is the correct time signature for the rhythm shown?")
                        .font(.system(size: 29))
                        .multilineTextAlignment(.center)
                        .padding()
                    HStack(spacing:50){
                        HStack(spacing: 20) {
                            AnswerButton1(imageName: "24", isSelected: selectedAnswer == "24", isCorrect: true) {
                                selectedAnswer = "24"
                                correctAnswer = true
                                wrongAnswer = false
                            }
                            AnswerButton1(imageName: "34", isSelected: selectedAnswer == "34", isCorrect: false) {
                                selectedAnswer = "34"
                                correctAnswer = false
                                wrongAnswer = true
                            }
                            AnswerButton1(imageName: "cut time", isSelected: selectedAnswer == "cut time", isCorrect: false) {
                                selectedAnswer = "cut time"
                                correctAnswer = false
                                wrongAnswer = true
                            }
                        }
                        
                        HStack(spacing: 20) {
                            Image("crochet")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 80)
                            Image("crochet rest")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 80)
                        }
                        .padding(.top, 20)
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
                            TimeSignaturesReview4View()
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
                        .padding(.bottom, 20)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TimeSignaturesReview3View()
}
