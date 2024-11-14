//
//  RhythmNotesRestsLearn12View.swift
//  scoresight1
//
//  Created by T Krobot on 12/11/24.
//

import SwiftUI

struct RhythmNotesRestsLearn12View: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                    }) {
                        NavigationLink(destination: RhythmNotesRestsView()) {
                            Image(systemName: "x.circle")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .white)
                                .font(.system(size: 50))
                        }
                    }
                    Spacer()
                    
                }
                
                HStack(spacing: 10) {
                    Image("triplet")
                        .resizable()
                        .frame(maxHeight: 400)
                        .frame(maxWidth: 250 )
                    
                    VStack(alignment: .trailing, spacing: -10) {
                        Text("this is a")
                            .font(.system(size: 50))
                        Text("triplet")
                            .font(.system(size: 90))
                            .bold()
                    }
                }

                HStack {
                    NavigationLink(destination: RhythmNotesRestsLearn11View()) {
                        Text("back")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                    Spacer()
                    NavigationLink(destination: RhythmNotesRestsLearn13View()) {
                        Text("next")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    RhythmNotesRestsLearn12View()
}

