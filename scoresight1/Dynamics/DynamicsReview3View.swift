////
////  DynamicsReview3View.swift
////  scoresight1
////
////  Created by Li Jiansheng on 11/11/24.
////
//
//import SwiftUI
//
//struct DynamicsReview3View: View {
//    
//    @State var questions: [Question] = [Question(question: "Which dynamic is louder than piano?", options: ["mezzopiano", "mezzoforte", "both of the above", "none of the above"], answer: "both of the above"), Question(question: "Which pedal should you press if you see the Ped. symbol?", options: ["una corda pedal (left)", "sostenuto pedal (middle)", "sustain pedal (right)"], answer: "sustain pedal (right)"), Question(question: "What is the difference between sforzando and rinforzando?", options: ["sforzando (sfz) is played only for a given phrase while rinforzando (rfz) is played only for a beat", "sforzando (sfz) is played only for a beat while rinforzando (rfz) is played only for a given phrase"], answer: "sforzando (sfz) is played only for a beat while rinforzando (rfz) is played only for a given phrase")]
//        @State var questionNumber: Int
//        @State var selectedButtonIndex: Int?
//    
//    var body: some View {
//        VStack {
//            DynamicsReview2View(question: questions[questionNumber], questionNumber: $questionNumber, selectedButtonIndex: $selectedButtonIndex)
//            DynamicsReview4View(questionNumber: $questionNumber, selectedButtonIndex: $selectedButtonIndex)
//                    }
//    }
//}
//
//#Preview {
//    DynamicsReview3View()
//}
