////
////  KeySignaturesAccidentalsReview2View.swift
////  scoresight1
////
////  Created by Li Jiansheng on 11/11/24.
////
//
//import SwiftUI
//
//struct KeySignaturesAccidentalsReview2View: View {
//    
//    let question: Question
//
//    @State var questions: [Question] = [Question(question: "What is the correct order of notes being played as shown below?", options: ["FFGGACC", "F#F#G#G#A#CC", "F#F#G#G#ACC#"], answer: "F#F#G#G#ACC#"), Question(question: "Is this a semitone?", options: ["yes", "no"], answer: "no"), Question(question: "What is the correct order of notes being played as shown below?", options: ["B♭, C, G♭, C, E, A", "B♭, C♭, F, C, E♭, A♭", "B♭, C, G𝄫, C, E♭, A♭"], answer: "B♭, C, G𝄫, C, E♭, A♭")]
//        @Binding var questionNumber: Int
//        @Binding var selectedButtonIndex: Int?
//    
//    var body: some View {
//        VStack(alignment:.leading) {
//                    Text(question.question)
//                        .padding()
//                        .font(.system(size: 30))
//                    VStack(alignment: .leading) {
//                        ForEach(0..<questions[questionNumber].options.count) { index in
//                                            Button(action: {
//                                                self.selectedButtonIndex = index
//                                            }) {
//                                                Text(questions[questionNumber].options[index])
//                                                    .font(.system(size: 25))
//                                                    .padding()
//                                                    .foregroundColor(self.selectedButtonIndex == index ? .white : .black)
//                                                    .background(self.selectedButtonIndex == index ? Color.black : Color.white)
//                                                    .cornerRadius(10)
//                                                    .overlay(
//                                                        RoundedRectangle(cornerRadius: 15)
//                                                            .stroke(Color.black, lineWidth: 3)
//                                                    )
//                                            }
//                                        }
//                                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding()
//
//                    }
//    }
//}
//
//#Preview {
//    KeySignaturesAccidentalsReview2View()
//}
