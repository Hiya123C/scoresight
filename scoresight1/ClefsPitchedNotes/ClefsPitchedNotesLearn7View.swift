//
//  ClefsPitchedNotes3View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesLearn7View: View {
    var body: some View {
        HStack {
            VStack {
                Text("this is a")
                    .font(.system(size: 40))
                Text("tenor")
                    .font(.system(size:80))
                    .bold()
                Text("clef")
                    .font(.system(size: 40))
            }
        }
    }
}

#Preview {
    ClefsPitchedNotesLearn7View()
}
