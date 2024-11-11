//
//  DynamicsLearn4View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct DynamicsLearn4View: View {
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
            //Image("sforzando")
            //  .resizable()
            //  .scaledToFit()
            Text("with a sudden emphasis (only for a beat)")
                .font(.system(size: 25))
            Text("sforzando")
                .font(.system(size:80))
                .bold()
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
}

#Preview {
    DynamicsLearn4View()
}
