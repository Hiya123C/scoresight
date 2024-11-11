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
                Text("middle C on the treble clef")
                    .font(.system(size: 40))
                    Image("treble middle c")
                        .resizable()
                        .frame(width: 500, height: 250, alignment: .bottom)
                        .position(x:300,y:50)
        }
    }
}

#Preview {
    ClefsPitchedNotesLearn2View()
}
