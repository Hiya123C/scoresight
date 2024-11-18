//
//  ClefsPitchedNotesReview4View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 14/11/24.
//

import SwiftUI

struct ClefsPitchedNotesReview4View: View {
    
    @State private var selectedAnswer: String? = nil
    @State private var correctAnswer: Bool = false
    @State private var wrongAnswer: Bool = false
    @Binding var isPresented:Bool
    
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
                        Text("Are there any octaves present in this bar?")
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
                            Image("cpn3")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    
                    Spacer()
                    ZStack {
                        HStack {
                            Spacer()
                            NavigationLink {
                                ClefsPitchedNotesReview5View(isPresented:$isPresented)
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
                            Text("Correct! None of the notes are eight notes apart.")
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
   ClefsPitchedNotesReview4View(isPresented: $isShowing)
}
