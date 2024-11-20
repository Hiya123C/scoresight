//
//  StartView.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                Text("score\nsight")
                    .fontWeight(.bold)
                    .font(.system(size:100)).environment(\._lineHeightMultiple, 0.75)
                Spacer()
                
                NavigationLink{
                    ContentView()
                }label:{
                    Text("start")
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
                Text("Tip: sound on! make sure your phone is in landscape mode.")
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    StartView()
}
