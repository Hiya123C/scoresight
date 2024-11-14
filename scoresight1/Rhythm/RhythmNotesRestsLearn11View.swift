//
//  RhythmNotesRestsLearn11View.swift
//  scoresight1
//
//  Created by T Krobot on 12/11/24.
//

import SwiftUI

struct RhythmNotesRestsLearn11View: View {
    var body: some View {
        NavigationView {
            VStack {
                // Top close button
                HStack {
                    NavigationLink(destination: RhythmNotesRestsView()) {
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size: 50))
                    }
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                // Image grid for the dotted notes and rests
                HStack(alignment: .top, spacing: 10) {
                    VStack {
                        Image("dotted semibreve rest")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 80) // Limit max height
                        Image("dotted semibreve")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 80) // Limit max height
                    }
                    VStack {
                        Image("dotted minim rest")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 80) // Limit max height
                        Image("dotted minim")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 80) // Limit max height
                    }
                    VStack {
                        Image("dotted crochet rest")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 80) // Limit max height
                        Image("dotted crochet")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 80) // Limit max height
                    }
                    VStack {
                        Image("dotted quaver rest")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 80) // Limit max height
                        Image("dotted quaver")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 80) // Limit max height
                    }
                }
                
                Spacer()
                
                // Navigation buttons
                HStack {
                    NavigationLink(destination: RhythmNotesRestsLearn10View()) {
                        Text("back")
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                            )
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }
                    Spacer()
                    NavigationLink(destination: RhythmNotesRestsLearn12View()) {
                        Text("next")
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                            )
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20) // Add bottom padding
            }
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    RhythmNotesRestsLearn11View()
}
