//
//  KeySignaturesAccidentalsReview4View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 14/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsReview4View: View {
    
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
                        Text("What is the correct order of notes?")
                            .font(.system(size: 40))
                        
                        Image("ksa3")
                            .resizable()
                            .scaledToFit()
                        
                        HStack {
                            Spacer()
                            AnswerButton(label: "B♭, C, G♭, C, E, A", isSelected: selectedAnswer == "B♭, C, G♭, C, E, A", isCorrect: false) {
                                selectedAnswer = "B♭, C, G♭, C, E, A"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "B♭, C♭, F, C, E♭, A♭", isSelected: selectedAnswer == "B♭, C♭, F, C, E♭, A♭", isCorrect: false) {
                                selectedAnswer = "B♭, C♭, F, C, E♭, A♭"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "B♭, C, G𝄫, C, E♭, A♭", isSelected: selectedAnswer == "B♭, C, G𝄫, C, E♭, A♭", isCorrect: true) {
                                selectedAnswer = "B♭, C, G𝄫, C, E♭, A♭"
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
                                KeySignaturesAccidentalsReview5View(isPresented:$isPresented)
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
                            Text("Correct! The 5 flats are BEADG and the G is a double flat.")
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
   KeySignaturesAccidentalsReview4View(isPresented: $isShowing)
}
