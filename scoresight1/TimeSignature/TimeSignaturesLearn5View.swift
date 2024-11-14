//
//  TimeSignaturesLearn5View.swift
//  scoresight1
//
//  Created by T Krobot on 13/11/24.
//

import SwiftUI

struct TimeSignaturesLearn5View: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Button(action: {}) {
                        NavigationLink(destination: TimeSignaturesView()) {
                            Image(systemName: "x.circle")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .white)
                                .font(.system(size: 50))
                        }
                    }
                    Spacer()
                }
                .padding([.top, .leading])

                HStack {
                    Image("cut time")
                        .resizable()
                        .scaledToFit()

                    Image("two minims")
                        .resizable()
                        .scaledToFit()
                }
                .padding()

                HStack {
                    NavigationLink(destination: TimeSignaturesLearn4View()) {
                        Text("back")
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                    Spacer()
                    NavigationLink(destination:  TimeSignaturesLearn6View()) {
                        Text("next")
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    TimeSignaturesLearn5View()
}
