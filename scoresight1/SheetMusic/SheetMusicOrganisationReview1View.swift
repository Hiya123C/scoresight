//
//  SheetMusicOrganisationReviewView.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct SheetMusicOrganisationReviewView: View {
    var body: some View {
        VStack {
            NavigationStack{
                HStack{
                    NavigationLink{
                        SheetMusicOrganisationView()
                    } label:{
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                Spacer()
                Text("test your\nknowledge!")
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .font(.system(size:100)).environment(\._lineHeightMultiple, 0.75)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SheetMusicOrganisationReviewView()
}
