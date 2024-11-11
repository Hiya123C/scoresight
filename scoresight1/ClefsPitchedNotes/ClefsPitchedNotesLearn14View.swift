//
//  ClefsPitchedNotesLearn14View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesLearn14View: View {
    var body: some View {
        HStack {
            VStack {
                Text("this is an")
                    .font(.system(size: 40))
                Text("octave")
                    .font(.system(size:80))
                    .bold()
            }
        }
    }
}

#Preview {
    ClefsPitchedNotesLearn14View()
}
