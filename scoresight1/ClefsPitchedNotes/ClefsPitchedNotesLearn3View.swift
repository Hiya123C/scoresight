//
//  ClefsPitchedNotesLearn2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesLearn3View: View {
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
                Image("bass")
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .trailing) {
                    Text("this is a")
                        .font(.system(size: 40))
                    Text("bass")
                        .font(.system(size:80))
                        .bold()
                    Text("clef")
                        .font(.system(size: 40))
                }
                // ask about separating the image and text
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
    ClefsPitchedNotesLearn3View()
}