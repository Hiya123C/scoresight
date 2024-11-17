//
//  KeySignaturesAccidentalsReview2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 14/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsReview2View: View {
    
    @State private var selectedAnswer: String? = nil
    @State private var correctAnswer: Bool = false
    @State private var wrongAnswer: Bool = false
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    HStack {
                        NavigationLink {
                            KeySignaturesAccidentalsView()
                        } label: {
                            Image(systemName: "x.circle")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .white)
                                .font(.system(size: 50))
                        }
                        Spacer()
                    }
                    Spacer()
                    
                    VStack {
                        Text("What is the correct order of notes?")
                            .font(.system(size: 40))
                        
                        Image("ksa1")
                            .resizable()
                            .scaledToFit()
                        
                        HStack {
                            Spacer()
                            AnswerButton(label: "F,F,G,G,A,C,C", isSelected: selectedAnswer == "F,F,G,G,A,C,C", isCorrect: false) {
                                selectedAnswer = "F,F,G,G,A,C,C"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "F#,F#,G#,G#,A#,C,C", isSelected: selectedAnswer == "F#,F#,G#,G#,A#,C,C", isCorrect: false) {
                                selectedAnswer = "F#,F#,G#,G#,A#,C,C"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "F#,F#,G#,G#,A,C,C#", isSelected: selectedAnswer == "F#,F#,G#,G#,A,C,C#", isCorrect: true) {
                                selectedAnswer = "F#,F#,G#,G#,A,C,C#"
                                correctAnswer = true
                                wrongAnswer = false
                                print("correct")
                            }
                            Spacer()
                        }
                    }
                    
                    Spacer()
                    ZStack {
                        HStack {
                            Spacer()
                            NavigationLink {
                                KeySignaturesAccidentalsReview3View()
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
                            Text("Correct! The 3 sharps are FCG and the 2nd last C is a natural.")
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    KeySignaturesAccidentalsReview2View()
}
