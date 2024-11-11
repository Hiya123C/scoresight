//
//  DynamicsLearn2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct DynamicsLearn2View: View {
    var body: some View {
        VStack {
            Text("gradually getting louder")
                .font(.system(size: 25))
            Text("crescendo")
                .font(.system(size:80))
                .bold()
        }
    }
}

#Preview {
    DynamicsLearn2View()
}
