//
//  SheetMusicOrganisationLearnView.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct SheetMusicOrganisationView: View {
    
    @State private var isFullScreenPresented = false
    @State private var isFullScreenPresented2 = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("sheet music\norganisation")
                .fontWeight(.bold)
                .font(.system(size:100)).environment(\._lineHeightMultiple, 0.75)
            Spacer()
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
            
            Spacer()
            
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
            Spacer()
        }
        .fullScreenCover(isPresented: $isFullScreenPresented) {
                    SheetMusicOrganisationLearnView()
                }
        .fullScreenCover(isPresented: $isFullScreenPresented2) {
                    SheetMusicOrganisationReviewView()
                }
    }
}

#Preview {
    SheetMusicOrganisationView()
}