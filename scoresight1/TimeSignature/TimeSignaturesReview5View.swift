//
//  TimeSignaturesReview5View.swift
//  scoresight1
//
//  Created by T Krobot on 16/11/24.
//

import SwiftUI

struct TimeSignaturesReview5View: View {
    var body: some View {
        VStack{
            NavigationStack{
                Spacer()
                Text("Great job!")
                    .font(.system(size: 100))
                    .bold()
                Spacer()
                
                NavigationLink{
                    ContentView()
                }label:{
                    Text("exit")
                        .padding()
                        .font(.system(size: 30))
                        .bold()
                        .frame(width: 110, height: 60)
                        .foregroundStyle(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.red)
                           
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 5)
                        )
                }
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TimeSignaturesReview5View()
}
