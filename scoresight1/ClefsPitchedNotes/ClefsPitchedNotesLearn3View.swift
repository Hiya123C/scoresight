//
//  ClefsPitchedNotesLearn2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesLearn3View: View {
    var body: some View {
        HStack {
            VStack {
                Text("this is a")
                    .font(.system(size: 30))
                    .frame(alignment: .trailing)
                Text("bass")
                    .font(.system(size:50))
                    .frame(alignment: .trailing)
                Text("clef")
                    .font(.system(size: 30))
                    .frame(alignment: .leading)
            }
        }
    }
}

#Preview {
    ClefsPitchedNotesLearn3View()
}
