//
//  ArticulationsOrnamentsReview2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct ArticulationsOrnamentsReview2View: View {
    
    let question: Question
    
    @State var questions: [Question] = [Question(question: "How should the articulation shown below be played?", options: ["smoothly", "short and detached", "detached but also smoothly"], answer: "smoothly"), Question(question: "Which articulation is being played in this melody?", options: ["legato (slur)", "marcato", "portato"], answer: "portato"), Question(question: "What is the name of the accent shown below?", options: ["staccato", "accent", "marcato"], answer: "accent")]
        @Binding var questionNumber: Int
        @Binding var selectedButtonIndex: Int?
    
    var body: some View {
        VStack(alignment:.leading) {
                    Text(question.question)
                        .padding()
                        .font(.system(size: 30))
                    VStack(alignment: .leading) {
                        ForEach(0..<questions[questionNumber].options.count) { index in
                                            Button(action: {
                                                self.selectedButtonIndex = index
                                            }) {
                                                Text(questions[questionNumber].options[index])
                                                    .font(.system(size: 25))
                                                    .padding()
                                                    .foregroundColor(self.selectedButtonIndex == index ? .white : .black)
                                                    .background(self.selectedButtonIndex == index ? Color.black : Color.white)
                                                    .cornerRadius(10)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 15)
                                                            .stroke(Color.black, lineWidth: 3)
                                                    )
                                            }
                                        }
                                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                    }
    }
}

#Preview {
    ArticulationsOrnamentsReview2View()
}
