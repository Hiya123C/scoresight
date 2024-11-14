//
//  ClefsPitchedNotesReview3View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 14/11/24.
//

import SwiftUI

struct ClefsPitchedNotesReview3View: View {
    
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
                        Text("If the notes shown below are C, D, A, B, C then what clef is this melody in?")
                            .font(.system(size: 40))
                        
                        HStack {
                            HStack {
                                VStack {
                                    Spacer()
                                    AnswerButton(label: "treble", isSelected: selectedAnswer == "treble", isCorrect: false) {
                                        selectedAnswer = "treble"
                                        correctAnswer = false
                                        wrongAnswer = true
                                        print("wrong")
                                    }
                                    Spacer()
                                    AnswerButton(label: "bass", isSelected: selectedAnswer == "bass", isCorrect: false) {
                                        selectedAnswer = "bass"
                                        correctAnswer = false
                                        wrongAnswer = true
                                        print("wrong")
                                    }
                                }
                                VStack {
                                    Spacer()
                                    AnswerButton(label: "alto", isSelected: selectedAnswer == "alto", isCorrect: true) {
                                        selectedAnswer = "alto"
                                        correctAnswer = true
                                        wrongAnswer = false
                                        print("correct")
                                    }
                                    Spacer()
                                    AnswerButton(label: "tenor", isSelected: selectedAnswer == "tenor", isCorrect: false) {
                                        selectedAnswer = "tenor"
                                        correctAnswer = false
                                        wrongAnswer = true
                                        print("wrong")
                                    }
                                    Spacer()
                                }
                            }
                            Image("cpn2")
                                .resizable()
                                .scaledToFit()
                            
                        }
                    }
                    
                    Spacer()
                    ZStack {
                        HStack {
                            Spacer()
                            NavigationLink {
                                ClefsPitchedNotesReview4View()
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
                            Text("Correct! The notes are in the alto clef.")
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
    ClefsPitchedNotesReview3View()
}
