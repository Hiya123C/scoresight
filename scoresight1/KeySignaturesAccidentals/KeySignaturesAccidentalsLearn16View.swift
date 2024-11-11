//
//  KeySignaturesAccidentalsLearn16View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsLearn16View: View {
    var body: some View {
        VStack {
            HStack {
                Text("a")
                    .font(.system(size: 40))
                Text("double/nflat")
                    .font(.system(size:60))
                    .bold()
                Text("goes down 2 semitones")
                    .font(.system(size: 40))
            }
        }
    }
}

#Preview {
    KeySignaturesAccidentalsLearn16View()
}
