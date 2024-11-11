//
//  KeySignaturesAccidentalsLearn15VIew.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsLearn15VIew: View {
    var body: some View {
        VStack {
            HStack {
                Text("a")
                    .font(.system(size: 40))
                Text("flat")
                    .font(.system(size:80))
                    .bold()
                Text("goes down 1 semitone")
                    .font(.system(size: 40))
            }
        }
    }
}

#Preview {
    KeySignaturesAccidentalsLearn15VIew()
}
