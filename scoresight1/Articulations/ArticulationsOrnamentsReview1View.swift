//
//  ArticulationsOrnamentsReviewView.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ArticulationsOrnamentsReviewView: View {
    var body: some View {
        VStack {
            Text("test your\nknowledge!")
                .fontWeight(.bold)
                .font(.system(size:100)).environment(\._lineHeightMultiple, 0.75)
        }
    }
}

#Preview {
    ArticulationsOrnamentsReviewView()
}
