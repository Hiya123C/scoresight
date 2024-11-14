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
        Text("**C**ows **D**o **E**at **F**resh\n**G**rass **A**nd **B**arley")
            .font(.system(size: 70))
            .frame(alignment: .center)
        // figure out the single bold letters in a word thing
        HStack{
            NavigationLink{
                ClefsPitchedNotesLearn8View()
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
                ClefsPitchedNotesLearn10View()
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ClefsPitchedNotesLearn9View()
}
