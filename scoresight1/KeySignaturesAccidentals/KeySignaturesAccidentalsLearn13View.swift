//
//  KeySignaturesAccidentalsLearn13View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsLearn13View: View {
    var body: some View {
        VStack {
            HStack {
                Text("a")
                    .font(.system(size: 40))
                Text("sharp")
                    .font(.system(size:80))
                    .bold()
                Text("goes up 1 semitone")
                    .font(.system(size: 40))
            }
        }

    }
}

#Preview {
    KeySignaturesAccidentalsLearn13View()
}
