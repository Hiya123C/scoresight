//
//  DynamicsLearn2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct DynamicsView: View {
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
            Text("dynamics")
                .fontWeight(.bold)
                .font(.system(size:100)).environment(\._lineHeightMultiple, 0.75)
                
            NavigationLink{
                DynamicsLearnView()
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
            NavigationLink{
                DynamicsReviewView()
            } label:{
                ZStack {
                    Text("review")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .bold()
                        .background (
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.black, lineWidth: 3)
                            .frame(width: 200, height: 50)
                        )
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DynamicsView()
}
