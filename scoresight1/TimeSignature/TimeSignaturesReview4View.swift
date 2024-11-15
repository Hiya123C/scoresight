//
//  TimeSignaturesReview4View.swift
//  scoresight1
//
//  Created by Crystal on 15/11/24.
//

import SwiftUI

struct TimeSignaturesReview4View: View {
    @State private var selectedAnswer: String? = nil
    @State private var correctAnswer: Bool = false
    @State private var wrongAnswer: Bool = false

    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    HStack {
                        NavigationLink {
                            TimeSignaturesView()
                        } label: {
                            Image(systemName: "x.circle")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .white)
                                .font(.system(size: 50))
                        }
                        Spacer()
                    }
                    .padding()

                    Text("A 3/4 time signature has three beats per measure, with each beat being a quarter note. True or False?")
                        .font(.system(size: 30))
                        .multilineTextAlignment(.leading)
                        .padding()

                    HStack {
                        Spacer()
                        AnswerButton(label: "False", isSelected: selectedAnswer == "False", isCorrect: false) {
                            selectedAnswer = "False"
                            correctAnswer = false
                            wrongAnswer = true
                            print("wrong")
                        }
                        Spacer()
                        AnswerButton(label: "True", isSelected: selectedAnswer == "True", isCorrect: true) {
                            selectedAnswer = "True"
                            correctAnswer = true
                            wrongAnswer = false
                            print("correct")
                        }
                        Spacer()
                  }
ZStack {
                        if correctAnswer {
                            Text("Correct!")
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

                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TimeSignaturesReview4View()
}
