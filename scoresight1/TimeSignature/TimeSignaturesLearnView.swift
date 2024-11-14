//
//  TimeSignaturesLearn2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct TimeSignaturesLearnView: View {
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
                    
                    VStack(alignment: .trailing, spacing: -10) {
                        Text("this is a")
                            .font(.system(size: 50))
                        Text("time")
                            .font(.system(size: 80))
                            .bold()
                        Text("signature")
                            .font(.system(size: 60))
                            .bold()
                    }

                }
                .padding()

                HStack {
                    
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
    TimeSignaturesLearnView()
}
