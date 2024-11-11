////
////  DynamicsReview2View.swift
////  scoresight1
////
////  Created by Li Jiansheng on 11/11/24.
////
//
//import SwiftUI
//
//struct DynamicsReview2View: View {
//    
//    let question: Question
//    
//    @State var questions: [Question] = [Question(question: "Which dynamic is louder than piano?", options: ["mezzopiano", "mezzoforte", "both of the above", "none of the above"], answer: "both of the above"), Question(question: "Which pedal should you press if you see the Ped. symbol?", options: ["una corda pedal (left)", "sostenuto pedal (middle)", "sustain pedal (right)"], answer: "sustain pedal (right)"), Question(question: "What is the difference between sforzando and rinforzando?", options: ["sforzando (sfz) is played only for a given phrase while rinforzando (rfz) is played only for a beat", "sforzando (sfz) is played only for a beat while rinforzando (rfz) is played only for a given phrase"], answer: "sforzando (sfz) is played only for a beat while rinforzando (rfz) is played only for a given phrase")]
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
//    DynamicsReview2View()
//}
