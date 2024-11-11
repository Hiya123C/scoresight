//
//  KeySignaturesAccidentalsLearn5View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsLearn5View: View {
    var body: some View {
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
        Text("Father Charles Goes Down And Ends Battle")
            .font(.system(size: 100))
            .frame(alignment: .center)
        // figure out the single bold letters in a word thing
        HStack{
            Spacer()
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

#Preview {
    KeySignaturesAccidentalsLearn5View()
}
