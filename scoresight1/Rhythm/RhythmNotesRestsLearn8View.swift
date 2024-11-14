//
//  RhythmNotesRestsLearn8View.swift
//  scoresight1
//
//  Created by T Krobot on 12/11/24.
//

import SwiftUI

struct RhythmNotesRestsLearn8View: View {
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
                
                HStack {
                    Image("semiquaver rest")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .trailing) {
                        Text("this is a")
                            .font(.system(size: 40))
                        Text("semiquaver")
                            .font(.system(size: 80))
                            .bold()
                        Text("rest")
                            .font(.system(size: 40))
                    }
                }
                
                HStack {
                    NavigationLink(destination: RhythmNotesRestsLearn7View()) {
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
                    NavigationLink(destination: RhythmNotesRestsLearn9View()) {
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
    RhythmNotesRestsLearn8View()
}

