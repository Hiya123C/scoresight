//
//  KeySignaturesAccidentalsLearn2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsLearn2View: View {
    var body: some View {
        VStack {
            HStack {
                NavigationLink{
                    KeySignaturesAccidentalsView()
                } label:{
                    Image(systemName: "x.circle")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .font(.system(size:50))
                }
                Spacer()
            }
            
            HStack {
//                Image("double sharp")
//                    .resizable()
//                    .scaledToFit()
                VStack(alignment: .trailing) {
                    Text("this is a")
                        .font(.system(size: 40))
                    Text("double/nsharp")
                        .font(.system(size:80))
                        .bold()
                }
            }
            HStack{
                NavigationLink{
                    KeySignaturesAccidentalsLearnView()
                } label:{
                    Text("back")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 3)
                                .frame(width:100,height:50)
                            
                        )
                        .foregroundStyle(.black)
                        .font(.system(size: 25))
                    Spacer()
                    
                }
                NavigationLink{
                    KeySignaturesAccidentalsLearn3View()
                } label:{
                    Text("next")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 3)
                                .frame(width:100,height:50)
                            
                        )
                        .foregroundStyle(.black)
                        .font(.system(size: 25))
                    
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    KeySignaturesAccidentalsLearn2View()
}
