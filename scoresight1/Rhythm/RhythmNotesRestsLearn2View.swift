//
//  RhythmNotesRestsLearn2.swift
//  scoresight1
//
//  Created by T Krobot on 10/11/24.
//

import SwiftUI

struct RhythmNotesRestsLearn2View: View {
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                HStack {
                    Spacer(minLength: 0)
                    NavigationLink {
                        RhythmNotesRestsView()
                    } label: {
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size: 50))
                            .padding(.top, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                HStack {
                    Image("semibreve rest")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100)
                    Spacer()
                    Spacer()
                }

                Button(action: {
                    showAlert = true
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color.red)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        Text("TAP!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .frame(width: 600, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 2)
                    )
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Warning"), message: Text("Do not play during a rest"), dismissButton: .default(Text("OK")))
                }

                Spacer()
                
                HStack {
                    NavigationLink {
                        RhythmNotesRestsLearnView()
                    } label: {
                        Text("Back")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                    .padding(.leading, 10)
                    
                    Spacer()
                    
                    NavigationLink(destination: RhythmNotesRestsLearn3View()) {
                        Text("Next")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                    .padding(.trailing, 10)
                }
                .padding(.bottom, 30)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RhythmNotesRestsLearn2View()
}
