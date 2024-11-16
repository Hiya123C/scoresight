//
//  KeySignaturesAccidentalsLearn2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsView: View {
    
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
            
            Spacer()
            ViewThatFits{
                Text("key signatures\n+accidentals")
                    .fontWeight(.bold)
                    .font(.system(size:95)).environment(\._lineHeightMultiple, 0.75)
                Text("key signatures\n+accidentals")
                    .fontWeight(.bold)
                    .font(.system(size:75)).environment(\._lineHeightMultiple, 0.75)
                Text("key signatures\n+accidentals")
                    .fontWeight(.bold)
                    .font(.system(size:70)).environment(\._lineHeightMultiple, 0.75)
                Text("key signatures\n+accidentals")
                    .fontWeight(.bold)
                    .font(.system(size:60)).environment(\._lineHeightMultiple, 0.75)
                Text("key signatures\n+accidentals")
                    .fontWeight(.bold)
                    .font(.system(size:50)).environment(\._lineHeightMultiple, 0.75)
            }
                
            Spacer()
            NavigationLink{
                KeySignaturesAccidentalsLearnView()
            } label:{
                ZStack {
                    Text("learn")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .bold()
                        .background (
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 3)
                                .frame(width: 200, height: 50)
                            )
                }
                .padding()
            }
            Spacer()
            NavigationLink{
                KeySignaturesAccidentalsReviewView()
            } label:{
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
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    KeySignaturesAccidentalsView()
}
