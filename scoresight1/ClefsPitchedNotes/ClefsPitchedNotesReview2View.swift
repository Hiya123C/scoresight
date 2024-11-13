//
//  ClefsPitchedNotesReview2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 13/11/24.
//

import SwiftUI

struct ClefsPitchedNotesReview2View: View {
    
    @State private var selectedButtonIndex1 = 0
    @State private var selectedButtonIndex2 = 0
    @State private var selectedButtonIndex3 = 0
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink{
                    ClefsPitchedNotesView()
                }label:{
                    Image(systemName: "x.circle")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .font(.system(size:50))
                }
                Spacer()
            }
            
            Text("What is the correct order of notes being played as shown below?")
                .font(.system(size: 40))
            HStack {
                VStack {
                    Button(action: {
                        selectedButtonIndex1 += 1
                    }) {
                        Text("B, C, G, A, B")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width:100,height:50)
                                
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                    Button(action: {
                        selectedButtonIndex2 += 1
                    }) {
                        Text("D, E, B, C, D")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width:100,height:50)
                                
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                    Button(action: {
                        selectedButtonIndex3 += 1
                    }) {
                        Text("D, C, F, E, B")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width:100,height:50)
                                
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                }
                Image("cpn1")
                    .resizable()
                    .scaledToFit()
            }
            HStack{
                NavigationLink{
                    ClefsPitchedNotesLearn14View()
                }label:{
                    Text("back")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 3)
                                .frame(width:100,height:50)
                            
                        )
                        .foregroundStyle(.black)
                        .font(.system(size: 25))
                    Spacer()
                    
                }
                NavigationLink{
                    //                    ClefsPitchedNotesReview3View()
                }label:{
                    Text("next")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 3)
                                .frame(width:100,height:50)
                            
                        )
                        .foregroundStyle(.black)
                        .font(.system(size: 25))
                    
                    
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ClefsPitchedNotesReview2View()
}
