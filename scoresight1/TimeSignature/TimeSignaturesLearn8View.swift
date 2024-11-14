//
//  TimeSignaturesLearn8View.swift
//  scoresight1
//
//  Created by T Krobot on 13/11/24.
//

import SwiftUI

struct TimeSignaturesLearn8View: View {
    @State private var topNumber: Int = 3
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: TimeSignaturesView()) {
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size: 50))
                    }
                    Spacer()
                }
                .padding(.top, 10)
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("\(topNumber)")
                            .font(.system(size: 90))
                            .fontWeight(.bold)
                        Text("8")
                            .font(.system(size: 90))
                            .fontWeight(.bold)
                    }
                    
                    ForEach(0..<topNumber, id: \.self) { _ in
                        Image("quaver")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 20)
                    }
                }
                
                Spacer()
                
                HStack {
                    NavigationLink(destination: TimeSignaturesLearn7View()) {
                        Text("back")
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if topNumber > 3 {
                            topNumber -= 1
                        }
                    }) {
                        Text("-")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                    }
                    
                    Button(action: {
                        if topNumber < 6 {
                            topNumber += 1
                        }
                    }) {
                        Text("+")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: TimeSignaturesLearn9View()) {
                        Text("next")
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }
                }
                .padding()
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    TimeSignaturesLearn8View()
}
