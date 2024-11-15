//
//  KeySignaturesAccidentalsLearn7View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsLearn7View: View {
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
            
            ZStack {
                Image("treble sharp")
                    .resizable()
                    .scaledToFit()
                Image("treble sharp f")
                    .resizable()
                    .scaledToFit()
                Image("treble sharp c")
                    .resizable()
                    .scaledToFit()
                Image("treble sharp g")
                    .resizable()
                    .scaledToFit()
                Image("treble sharp d")
                    .resizable()
                    .scaledToFit()
                Image("treble sharp a")
                    .resizable()
                    .scaledToFit()
                Image("treble sharp e")
                    .resizable()
                    .scaledToFit()
                Image("treble sharp b")
                    .resizable()
                    .scaledToFit()
                    }
                HStack{
                    NavigationLink{
                        KeySignaturesAccidentalsLearn6View()
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
                        KeySignaturesAccidentalsLearn8View()
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
    KeySignaturesAccidentalsLearn7View()
}
