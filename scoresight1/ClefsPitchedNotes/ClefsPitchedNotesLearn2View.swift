//
//  ClefsPitchedNotesLearn2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesLearn2View: View {
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
                Text("middle C on the treble clef")
                    .font(.system(size: 40))
                    Image("treble middle c")
                        .resizable()
                        .scaledToFit()
                HStack{
                    NavigationLink{
                        ClefsPitchedNotesLearnView()
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
                        ClefsPitchedNotesLearn3View()
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
    ClefsPitchedNotesLearn2View()
}
