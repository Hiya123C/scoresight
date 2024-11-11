//
//  KeySignaturesAccidentalsLearn14View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsLearn14View: View {
    var body: some View {
        VStack {
            HStack {
                Text("a")
                    .font(.system(size: 40))
                Text("double/nsharp")
                    .font(.system(size:60))
                    .bold()
                Text("goes up 2 semitones")
                    .font(.system(size: 40))
            }
        }
    }
}

#Preview {
    KeySignaturesAccidentalsLearn14View()
}
