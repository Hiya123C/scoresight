////
////  KeySignaturesAccidentalsReview3View.swift
////  scoresight1
////
////  Created by Li Jiansheng on 11/11/24.
////
//
//import SwiftUI
//
//struct KeySignaturesAccidentalsReview3View: View {
//    
//    @State var questions: [Question] = [Question(question: "What is the correct order of notes being played as shown below?", options: ["FFGGACC", "F#F#G#G#A#CC", "F#F#G#G#ACC#"], answer: "F#F#G#G#ACC#"), Question(question: "Is this a semitone?", options: ["yes", "no"], answer: "no"), Question(question: "What is the correct order of notes being played as shown below?", options: ["B♭, C, G♭, C, E, A", "B♭, C♭, F, C, E♭, A♭", "B♭, C, G𝄫, C, E♭, A♭"], answer: "B♭, C, G𝄫, C, E♭, A♭")]
//        @State var questionNumber: Int
//        @State var selectedButtonIndex: Int?
//    
//    var body: some View {
//        VStack {
//            KeySignaturesAccidentalsReview2View(question: questions[questionNumber], questionNumber: $questionNumber, selectedButtonIndex: $selectedButtonIndex)
//            KeySignaturesAccidentalsReview4View(questionNumber: $questionNumber, selectedButtonIndex: $selectedButtonIndex)
//                    }
//    }
//}
//
//#Preview {
//    KeySignaturesAccidentalsReview3View()
//}
