//
//  RhythmNotesRestsLearn5View.swift
//  scoresight1
//
//  Created by T Krobot on 11/11/24.
//

import SwiftUI

struct RhythmNotesRestsLearn5View: View {
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
                    Image("quaver")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .trailing) {
                        Text("this is a")
                            .font(.system(size: 40))
                        Text("quaver")
                            .font(.system(size: 80))
                            .bold()
                        Text("note")
                            .font(.system(size: 40))
                    }
                }
                
                HStack {
                    NavigationLink(destination: RhythmNotesRestsLearn4View()) {
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
                    NavigationLink(destination: RhythmNotesRestsLearn6View()) {
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

struct RhythmNotesRestsLearn5View_Previews: PreviewProvider {
    static var previews: some View {
        RhythmNotesRestsLearn5View()
    }
}
