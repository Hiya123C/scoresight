//
//  RhythmNotesRestsView.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct RhythmNotesRestsView: View {
    
    @State private var isFullScreenPresented = false
    @State private var isFullScreenPresented2 = false
    
    var body: some View {
        VStack {
            Text("rhythm\nnotes+rests")
                .fontWeight(.bold)
                .font(.system(size:100)).environment(\._lineHeightMultiple, 0.75)
            Button(action: {
                isFullScreenPresented = true
            }) {
            Text("learn")
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
                    .bold()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.black, lineWidth: 3)
                            .frame(width: 200, height: 50)
                    )
            }
            Button(action: {
                isFullScreenPresented2 = true
            }) {
            Text("review")
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
                    .bold()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.black, lineWidth: 3)
                            .frame(width: 200, height: 50)
                    )
            }
        }
        .fullScreenCover(isPresented: $isFullScreenPresented) {
                    RhythmNotesRestsLearnView()
                }
        .fullScreenCover(isPresented: $isFullScreenPresented2) {
                    RhythmNotesRestsReviewView()
                }
    }
}

#Preview {
    RhythmNotesRestsView()
}
