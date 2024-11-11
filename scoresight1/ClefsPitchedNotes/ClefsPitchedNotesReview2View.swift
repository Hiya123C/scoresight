////
////  ClefsPitchedNotesReview2View.swift
////  scoresight1
////
////  Created by Li Jiansheng on 9/11/24.
////
//
//import SwiftUI
//
//struct ClefsPitchedNotesReview2View: View {
//    
//    let question: Question
//        // replace the words in the brackets w images of the word
//    @State var questions: [Question] = [Question(question: "What is the correct order of notes being played as shown below?", options: ["B, C, G, A, B", "D, E, B, C, D", "D, C, F, E, B"], answer: "D, E, B, C, D"), Question(question: "If the notes shown below are C, D, A, B, C then what clef is this melody in?", options: ["treble", "bass", "alto", "tenor"], answer: "alto"), Question(question: "Are there any octaves present in this bar?", options: ["yes", "no"], answer: "no")]
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
//    ClefsPitchedNotesReview2View()
//}
