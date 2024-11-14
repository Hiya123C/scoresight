//
//  DynamicsReview4View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 14/11/24.
//

import SwiftUI

struct DynamicsReview4View: View {
    
    @State private var selectedAnswer: String? = nil
    @State private var correctAnswer: Bool = false
    @State private var wrongAnswer: Bool = false
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    HStack {
                        NavigationLink {
                            DynamicsView()
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
                        Text("Which pedal should you press if you see the Ped. symbol?")
                            .font(.system(size: 30))

                            }
                            Spacer()
                            AnswerButton(label: "rinforzando (rfz) is played only for a given phrase while sforzando (sfz) is played only for a beat", isSelected: selectedAnswer == "rinforzando (rfz) is played only for a given phrase while sforzando (sfz) is played only for a beat", isCorrect: true) {
                                selectedAnswer = "rinforzando (rfz) is played only for a given phrase while sforzando (sfz) is played only for a beat"
                                correctAnswer = true
                                wrongAnswer = false
                                print("correct")
                            }
                
                    // ask abt padding
                            Spacer()
                            AnswerButton(label: "sforzando (sfz) is played only for a given phrase while rinforzando (rfz) is played only for a beat", isSelected: selectedAnswer == "sforzando (sfz) is played only for a given phrase while rinforzando (rfz) is played only for a beat", isCorrect: false) {
                                selectedAnswer = "sforzando (sfz) is played only for a given phrase while rinforzando (rfz) is played only for a beat"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                        
                    }
                    
                    Spacer()
                    ZStack {
                        HStack {
                            Spacer()
                            NavigationLink {
                                DynamicsReview4View()
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
                            Text("Correct! sfz is played only for a beat while rfz is played for a phrase.")
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
    DynamicsReview4View()
}