//
//  ArticulationsOrnamentsReview4View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 14/11/24.
//

import SwiftUI

struct ArticulationsOrnamentsReview4View: View {
    
    @State private var selectedAnswer: String? = nil
    @State private var correctAnswer: Bool = false
    @State private var wrongAnswer: Bool = false
    @Binding var isPresented: Bool
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
                        Text("What is this ornament?")
                            .font(.system(size: 30))
                        
                        Image("ao2")
                            .resizable()
                            .scaledToFit()
                        HStack {
                            Spacer()
                            AnswerButton(label: "acciaccatura", isSelected: selectedAnswer == "acciaccatura", isCorrect: true) {
                                selectedAnswer = "acciaccatura"
                                correctAnswer = true
                                wrongAnswer = false
                                print("correct")
                            }
                            Spacer()
                            AnswerButton(label: "apoggiatura", isSelected: selectedAnswer == "apoggiatura", isCorrect: false) {
                                selectedAnswer = "apoggiatura"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "grace note", isSelected: selectedAnswer == "grace note", isCorrect: false) {
                                selectedAnswer = "grace note"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "crush note", isSelected: selectedAnswer == "crush note", isCorrect: true) {
                                selectedAnswer = "crush note"
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
                                ArticulationsOrnamentsReview5View(isPresented:$isPresented)
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
                            Text("Correct! This ornament is an acciaccatura, aka a crush note.")
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
    @Previewable @State var isShowing = false
  ArticulationsOrnamentsReview4View(isPresented: $isShowing)
}
