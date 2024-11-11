//
//  ClefsPitchedNotesLearn9View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesLearn9View: View {
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
        Text("Cows Do Eat Fresh/nGrass And Barley")
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
    ClefsPitchedNotesLearn9View()
}
