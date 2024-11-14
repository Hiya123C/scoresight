//
//  ClefsPitchedNotesReview2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 13/11/24.
//

import SwiftUI

struct ClefsPitchedNotesReview2View: View {
    
    @State private var selectedAnswer: String? = nil
    @State private var correctAnswer: Bool = false
    @State private var wrongAnswer: Bool = false
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    HStack {
                        NavigationLink {
                            ClefsPitchedNotesView()
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
                        
                        Image("cpn1")
                            .resizable()
                            .scaledToFit()
                        
                        HStack {
                            Spacer()
                            AnswerButton(label: "B, C, G, A, B", isSelected: selectedAnswer == "B, C, G, A, B", isCorrect: false) {
                                selectedAnswer = "B, C, G, A, B"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "D, E, B, C, D", isSelected: selectedAnswer == "D, E, B, C, D", isCorrect: true) {
                                selectedAnswer = "D, E, B, C, D"
                                correctAnswer = true
                                wrongAnswer = false
                                print("correct")
                            }
                            Spacer()
                            AnswerButton(label: "D, C, F, E, B", isSelected: selectedAnswer == "D, C, F, E, B", isCorrect: false) {
                                selectedAnswer = "D, C, F, E, B"
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
                                ClefsPitchedNotesReview3View()
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
                            Text("Correct! The notes D, E, B, C, D are in the bass clef.")
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
    ClefsPitchedNotesReview2View()
}
