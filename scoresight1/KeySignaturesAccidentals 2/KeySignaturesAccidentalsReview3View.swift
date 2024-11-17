//
//  KeySignaturesAccidentalsReview3View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 14/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsReview3View: View {
    
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
                        Text("Is this a semitone?")
                            .font(.system(size: 40))
                        
                        HStack {
                            VStack {
                                Spacer()
                                AnswerButton(label: "yes", isSelected: selectedAnswer == "yes", isCorrect: false) {
                                    selectedAnswer = "yes"
                                    correctAnswer = false
                                    wrongAnswer = true
                                    print("wrong")
                                }
                                Spacer()
                                AnswerButton(label: "no", isSelected: selectedAnswer == "no", isCorrect: true) {
                                    selectedAnswer = "no"
                                    correctAnswer = true
                                    wrongAnswer = false
                                    print("correct")
                                }
                                Spacer()
                            }
                                Image("ksa2")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                    
                    Spacer()
                    ZStack {
                        HStack {
                            Spacer()
                            NavigationLink {
                                KeySignaturesAccidentalsReview4View()
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
                            Text("Correct! It is two semitones and not one.")
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    KeySignaturesAccidentalsReview3View()
}
