//
//  ContentView.swift
//  scoresight1
//
//  Created by Crystal on 9/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isFullScreenPresented1 = false
    @State private var isFullScreenPresented2 = false
    @State private var isFullScreenPresented3 = false
    @State private var isFullScreenPresented4 = false
    @State private var isFullScreenPresented5 = false
    @State private var isFullScreenPresented6 = false
    @State private var isFullScreenPresented7 = false
    @State private var isFullScreenPresented8 = false
    
    var body: some View {
        VStack {
            Button(action: {
                isFullScreenPresented1 = true
            }) {
            Text("sheet music organisation")
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
                    .bold()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.black, lineWidth: 3)
                            .frame(width: 200, height: 50)
                    )
            }
            Button(action: {
                isFullScreenPresented2 = true
            }) {
            Text("rhythm notes + rests")
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
                    .bold()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.black, lineWidth: 3)
                            .frame(width: 200, height: 50)
                    )
            }
            Button(action: {
                isFullScreenPresented3 = true
            }) {
            Text("time signatures")
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
                    .bold()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.black, lineWidth: 3)
                            .frame(width: 200, height: 50)
                    )
            }
            Button(action: {
                isFullScreenPresented4 = true
            }) {
            Text("clefs + pitched notes")
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
                    .bold()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.black, lineWidth: 3)
                            .frame(width: 200, height: 50)
                    )
            }
            Button(action: {
                isFullScreenPresented5 = true
            }) {
            Text("key signatures + accidentals")
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
                    .bold()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.black, lineWidth: 3)
                            .frame(width: 200, height: 50)
                    )
            }
            Button(action: {
                isFullScreenPresented6 = true
            }) {
            Text("dynamics")
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
                    .bold()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.black, lineWidth: 3)
                            .frame(width: 200, height: 50)
                    )
            }
            Button(action: {
                isFullScreenPresented7 = true
            }) {
            Text("articulations + ornaments")
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
                    .bold()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.black, lineWidth: 3)
                            .frame(width: 200, height: 50)
                    )
            }
            Button(action: {
                isFullScreenPresented8 = true
            }) {
            Text("sandbox")
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
                    .bold()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.black, lineWidth: 3)
                            .frame(width: 200, height: 50)
                    )
            }
        }
        .fullScreenCover(isPresented: $isFullScreenPresented1) {
                    
                }
        .fullScreenCover(isPresented: $isFullScreenPresented2) {
                    
                }
        .fullScreenCover(isPresented: $isFullScreenPresented3) {
                    
                }
        .fullScreenCover(isPresented: $isFullScreenPresented4) {
                    
                }
        .fullScreenCover(isPresented: $isFullScreenPresented5) {
                    
                }
        .fullScreenCover(isPresented: $isFullScreenPresented6) {
                    
                }
        .fullScreenCover(isPresented: $isFullScreenPresented7) {
                    
                }
        .fullScreenCover(isPresented: $isFullScreenPresented8) {
            SandboxView()
                }
    }
}


#Preview {
    ContentView()
}
