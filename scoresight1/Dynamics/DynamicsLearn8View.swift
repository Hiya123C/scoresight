//
//  DynamicsLearn8View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct DynamicsLearn8View: View {
    var body: some View {
        VStack {
            Text("use the sustain pedal on the piano (right pedal)")
                .font(.system(size: 25))
            Text("pedal")
                .font(.system(size:80))
                .bold()
        }
    }
}

#Preview {
    DynamicsLearn8View()
}
