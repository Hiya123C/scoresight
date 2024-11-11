//
//  ClefsPitchedNotes2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesLearnView: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("treble")
                .resizable()
                .frame(width: 500, height: 250, alignment: .bottom)
                .position(x:300,y:50)
            
             //position?
            VStack {
                Text("this is a")
                    .font(.system(size: 40))
                Text("treble")
                    .font(.system(size:80))
                    .bold()
                Text("clef")
                    .font(.system(size: 40))
            }
        }
    }
}

#Preview {
    ClefsPitchedNotesLearnView()
}
