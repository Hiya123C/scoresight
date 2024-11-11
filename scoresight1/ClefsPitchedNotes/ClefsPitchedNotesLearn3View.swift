//
//  ClefsPitchedNotesLearn2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesLearn3View: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("bass")
                .resizable()
                .frame(width: 500, height: 250, alignment: .bottom)
                .position(x:300,y:50)
            VStack {
                Text("this is a")
                    .font(.system(size: 40))
                Text("bass")
                    .font(.system(size:80))
                    .bold()
                Text("clef")
                    .font(.system(size: 40))
            }
        }
    }
}

#Preview {
    ClefsPitchedNotesLearn3View()
}
