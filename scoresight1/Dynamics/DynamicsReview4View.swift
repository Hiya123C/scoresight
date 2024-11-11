//
//  DynamicsReview4View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct DynamicsReview4View: View {
    
    @Binding var questionNumber: Int
    @Binding var selectedButtonIndex: Int?
    
    @State private var isFullScreenPresented = false
    
    var body: some View {
        VStack {
                    Button(action: {
                        questionNumber += 1
                        selectedButtonIndex = nil
                        
                        if questionNumber == 3 {
                            isFullScreenPresented = true
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
                .fullScreenCover(isPresented: $isFullScreenPresented) {
                    
                }
    }
}

#Preview {
    DynamicsReview4View()
}
