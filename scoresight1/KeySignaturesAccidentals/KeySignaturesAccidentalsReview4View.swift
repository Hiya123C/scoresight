//
//  KeySignaturesAccidentalsReview4View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsReview4View: View {
    
    @Binding var questionNumber: Int
    @Binding var selectedButtonIndex: Int?
    
    var body: some View {
        VStack {
                    Button(action: {
                        questionNumber += 1
                        selectedButtonIndex = nil
                        
                        if questionNumber == 3 {

                        }
                    }) {
                        Text("finish")
                            .font(.system(size: 25))
                            .foregroundStyle(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                    }
                }
    }
}

#Preview {
    KeySignaturesAccidentalsReview4View()
}
