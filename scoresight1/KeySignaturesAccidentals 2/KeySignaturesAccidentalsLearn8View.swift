//
//  KeySignaturesAccidentalsLearn8View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsLearn8View: View {
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
            Text("flats are in the opposite order:")
                .font(.system(size: 40))
            Text("B E A D G C F")
                .font(.system(size: 100))
                .fontWeight(.bold)
            HStack{
                NavigationLink{
                    KeySignaturesAccidentalsLearn7View()
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
                    KeySignaturesAccidentalsLearn9View()
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
    KeySignaturesAccidentalsLearn8View()
}
