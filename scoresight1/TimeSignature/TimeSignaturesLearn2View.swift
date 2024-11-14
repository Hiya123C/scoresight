//
//  TimeSignaturesLearn2View.swift
//  scoresight1
//
//  Created by T Krobot on 13/11/24.
//

import SwiftUI

struct TimeSignaturesLearn2View: View {
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
                    Image("44")
                        .resizable()
                        .scaledToFit()

                    Image("4 crochets")
                        .resizable()
                        .scaledToFit()
                }
                .padding()

                HStack {
                    NavigationLink(destination: TimeSignaturesLearnView()) {
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
                    NavigationLink(destination:  TimeSignaturesLearn3View()) {
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
    TimeSignaturesLearn2View()
}
