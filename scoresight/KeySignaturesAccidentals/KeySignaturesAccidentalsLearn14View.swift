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
                Button(action:{
                    
                }){
                    Image(systemName: "x.circle")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .font(.system(size:50))
                }
                Spacer()
            }
            HStack {
                Text("a")
                    .font(.system(size: 40))
                Text("double sharp")
                    .font(.system(size: 80))
                    .bold()
                Text("goes up 2 semitones")
                    .font(.system(size:40))
                //Image("double sharp semitone")
                //  .resizable()
                //  .scaledToFit()
            }
            HStack{
                Button(action: {
                    
                })
                {
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
                Button(action: {
                    
                })
                {
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
    }
}

#Preview {
    KeySignaturesAccidentalsLearn14View()
}