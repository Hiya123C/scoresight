//
//  DynamicsReview3View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 14/11/24.
//

import SwiftUI

struct DynamicsReview3View: View {
    
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
                        
                        Image("dynamics")
                            .resizable()
                            .scaledToFit()
                        HStack {
                            Spacer()
                            AnswerButton(label: "una corda pedal", isSelected: selectedAnswer == "una corda pedal", isCorrect: false) {
                                selectedAnswer = "una corda pedal"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "sostenuto pedal", isSelected: selectedAnswer == "sostenuto pedal", isCorrect: false) {
                                selectedAnswer = "sostenuto pedal"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "sustain pedal", isSelected: selectedAnswer == "sustain pedal", isCorrect: true) {
                                selectedAnswer = "sustain pedal"
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
                            Text("Correct! The sustain pedal on the right is used.")
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
    DynamicsReview3View()
}
