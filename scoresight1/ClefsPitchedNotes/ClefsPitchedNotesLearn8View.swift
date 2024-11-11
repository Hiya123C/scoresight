//
//  ClefsPitchedNotesLearn8View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesLearn8View: View {
    var body: some View {
        VStack {
            Text("middle C on the tenor clef")
                .font(.system(size: 40))
                Image("tenor middle c")
                    .resizable()
                    .frame(width: 500, height: 250, alignment: .bottom)
                    .position(x:300,y:50)
    }
    }
}

#Preview {
    ClefsPitchedNotesLearn8View()
}
