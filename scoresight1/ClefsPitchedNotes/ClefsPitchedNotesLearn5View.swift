//
//  ClefsPitchedNotesLearn3View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesLearn5View: View {
    var body: some View {
        HStack {
            VStack {
                Text("this is an")
                    .font(.system(size: 40))
                Text("alto")
                    .font(.system(size:80))
                    .bold()
                Text("clef")
                    .font(.system(size: 40))
            }
        }
    }
}

#Preview {
    ClefsPitchedNotesLearn5View()
}
