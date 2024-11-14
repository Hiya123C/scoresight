//
//  TimeSignaturesLearnView.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct TimeSignaturesView: View {
    
    @State private var isFullScreenPresented = false
    @State private var isFullScreenPresented2 = false
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: ContentView()) {
                    Image(systemName: "xmark")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            
            Spacer()
            
            Text("time signatures")
                .font(.system(size: min(UIScreen.main.bounds.width * 0.12, 60), weight: .bold))
                .multilineTextAlignment(.center)
                .lineSpacing(-8)
                .foregroundColor(.black)
                .padding(.horizontal)
            
            Spacer()
            
            VStack(spacing: 15) {
                Button(action: {
                    isFullScreenPresented = true
                }) {
                    Text("learn")
                        .font(.system(size: 25, weight: .bold))
                        .frame(width: 150, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 3)
                        )
                        .foregroundColor(.black)
                }
                
                Button(action: {
                    isFullScreenPresented2 = true
                }) {
                    Text("review")
                        .font(.system(size: 25, weight: .bold))
                        .frame(width: 150, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 3)
                        )
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom, 40)
        }
        .background(Color.white.ignoresSafeArea())
        .fullScreenCover(isPresented: $isFullScreenPresented) {
            TimeSignaturesLearnView()
        }
        .fullScreenCover(isPresented: $isFullScreenPresented2) {
            TimeSignaturesReviewView()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    TimeSignaturesView()
}
