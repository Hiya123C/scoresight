//
//  ArticulationsOrnamentsReview3View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct ArticulationsOrnamentsReview3View: View {
    
    @State var questions: [Question] = [Question(question: "How should the articulation shown below be played?", options: ["smoothly", "short and detached", "detached but also smoothly"], answer: "smoothly"), Question(question: "Which articulation is being played in this melody?", options: ["legato (slur)", "marcato", "portato"], answer: "portato"), Question(question: "What is the name of the accent shown below?", options: ["staccato", "accent", "marcato"], answer: "accent")]
        @State var questionNumber: Int
        @State var selectedButtonIndex: Int?
    
    var body: some View {
        VStack {
            ArticulationsOrnamentsReview2View(question: questions[questionNumber], questionNumber: $questionNumber, selectedButtonIndex: $selectedButtonIndex)
            ArticulationsOrnamentsReview4View(questionNumber: $questionNumber, selectedButtonIndex: $selectedButtonIndex)
                    }
    }
}

#Preview {
    ArticulationsOrnamentsReview3View()
}
