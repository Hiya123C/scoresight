//
//  ClefsPitchedNotesView.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesView: View {
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink{
                    ContentView()
                }label:{
                    Image(systemName: "x.circle")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .font(.system(size:50))
                }
                Spacer()
            }
            Text("clefs+\npitched notes")
                .fontWeight(.bold)
                .font(.system(size:100)).environment(\._lineHeightMultiple, 0.75)
                
            NavigationLink{
                ClefsPitchedNotesLearnView()
            }label:{
                ZStack {
                    Text("learn")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .bold()
                        RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 3)
                                .frame(width: 200, height: 50)
                }
                .padding()
            }
            NavigationLink{
                ClefsPitchedNotesReviewView()
            }label:{
                ZStack {
                    Text("review")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .bold()
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.black, lineWidth: 3)
                            .frame(width: 200, height: 50)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ClefsPitchedNotesView()
}
