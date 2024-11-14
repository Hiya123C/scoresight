//
//  DynamicsReview2.swift
//  scoresight1
//
//  Created by Li Jiansheng on 14/11/24.
//

import SwiftUI

struct DynamicsReview2View: View {
    
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
                        Text("Which dynamic(s) is/are louder than piano?")
                            .font(.system(size: 40))
                        
                        Image("piano")
                            .resizable()
                            .scaledToFit()
                        HStack {
                            Spacer()
                            AnswerButton(label: "mezzopiano", isSelected: selectedAnswer == "mezzopiano", isCorrect: false) {
                                selectedAnswer = "mezzopiano"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "mezzoforte", isSelected: selectedAnswer == "mezzoforte", isCorrect: false) {
                                selectedAnswer = "mezzoforte"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "both", isSelected: selectedAnswer == "both", isCorrect: true) {
                                selectedAnswer = "both"
                                correctAnswer = true
                                wrongAnswer = false
                                print("correct")
                            }
                            Spacer()
                            AnswerButton(label: "neither", isSelected: selectedAnswer == "neither", isCorrect: false) {
                                selectedAnswer = "neither"
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
                            NavigationLink {
                                DynamicsReview3View()
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
                            Text("Correct! Both mezzopiano and mezzoforte are louder than piano.")
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
    DynamicsReview2View()
}
