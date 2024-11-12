//
//  KeySignaturesAccidentalsLearn14View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsLearn14View: View {
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
            VStack {
                HStack {
                    Text("a")
                        .font(.system(size: 40))
                    Text("double/nsharp")
                        .font(.system(size: 60))
                        .bold()
                    Text("goes up 2 semitones")
                        .font(.system(size:40))
                }
                Image("double sharp semitone")
                    .resizable()
                    .scaledToFit()
            }
            HStack{
                NavigationLink{
                    KeySignaturesAccidentalsLearn13View()
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
                    KeySignaturesAccidentalsLearn15View()
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
    KeySignaturesAccidentalsLearn14View()
}
