//
//  ClefsPitchedNotes2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesLearnView: View {
    // ask why i can't press the buttons
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
                Image("treble")
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .trailing) {
                    Text("this is a")
                        .font(.system(size: 40))
                    Text("treble")
                        .font(.system(size:80))
                        .bold()
                    Text("clef")
                        .font(.system(size: 40))
                }
            }
                HStack{
                    Spacer()
                    NavigationLink{
                        ClefsPitchedNotesLearn2View()
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
    ClefsPitchedNotesLearnView()
}
