//
//  ArticulationsOrnamentsReview2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 14/11/24.
//

import SwiftUI

struct ArticulationsOrnamentsReview2View: View {
    
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
                        Text("What is the correct way to play this articulation?")
                            .font(.system(size: 30))
                        
                        Image("ao1")
                            .resizable()
                            .scaledToFit()
                        HStack {
                            Spacer()
                            AnswerButton(label: "smoothly", isSelected: selectedAnswer == "smoothly", isCorrect: true) {
                                selectedAnswer = "smoothly"
                                correctAnswer = true
                                wrongAnswer = false
                                print("correct")
                            }
                            Spacer()
                            AnswerButton(label: "short and detached", isSelected: selectedAnswer == "short and detached", isCorrect: false) {
                                selectedAnswer = "short and detached"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "detached but also smoothly", isSelected: selectedAnswer == "detached but also smoothly", isCorrect: false) {
                                selectedAnswer = "detached but also smoothly"
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
                                ArticulationsOrnamentsReview3View(isPresented:$isPresented)
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
                            Text("Correct! The articulation should be played smoothly.")
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
  ArticulationsOrnamentsReview2View(isPresented: $isShowing)
}
