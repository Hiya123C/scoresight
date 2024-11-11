//
//  ClefsPitchedNotesLearn10View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesLearn10View: View {
    var body: some View {
        VStack {
            Text("these are the pitched notes on the treble clef.")
                .font(.system(size: 40))
            Image("treble clef pitched notes")
                .resizable()
                .frame(width: 500, height: 250, alignment: .bottom)
                .position(x:300,y:50)
        }
    }
}

#Preview {
    ClefsPitchedNotesLearn10View()
}
