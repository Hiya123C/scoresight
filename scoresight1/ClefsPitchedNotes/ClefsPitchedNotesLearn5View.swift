//
//  ClefsPitchedNotesLearn3View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesLearn5View: View {
    var body: some View {
        VStack {
            HStack {
                NavigationLink{
                    ClefsPitchedNotesView()
                }label:{
                    Image(systemName: "x.circle")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .font(.system(size:50))
                }
                Spacer()
            }
            
            HStack {
                Image("alto")
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .trailing) {
                    Text("this is an")
                        .font(.system(size: 40))
                    Text("alto")
                        .font(.system(size:80))
                        .bold()
                    Text("clef")
                        .font(.system(size: 40))
                }
                // ask about separating the image and text
            }
            HStack{
                NavigationLink{
                    ClefsPitchedNotesLearn4View()
                }label:{
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
                    ClefsPitchedNotesLearn6View()
                }label:{
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
    ClefsPitchedNotesLearn5View()
}
