//
//  ClefsPitchedNotesView.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct ClefsPitchedNotesView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingSheet = false
    @State private var showingSheet1 = false
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    Button(action:{
                        dismiss()
                    }){
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }

                Spacer()
                ViewThatFits{
                    Text("clefs +\npitched notes")
                        .fontWeight(.bold)
                        .font(.system(size:95)).environment(\._lineHeightMultiple, 0.75)
                        .multilineTextAlignment(.center)
                    Text("clefs +\npitched notes")
                        .fontWeight(.bold)
                        .font(.system(size:75)).environment(\._lineHeightMultiple, 0.75)
                        .multilineTextAlignment(.center)
                    
                    Text("clefs\n+pitched notes")
                        .fontWeight(.bold)
                        .font(.system(size:60)).environment(\._lineHeightMultiple, 0.75)
                        .multilineTextAlignment(.center)
                    
                }
                Spacer()
                Button(action:{
                    showingSheet = true
                }){
                    Text("learn")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .padding()
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 3)
                                .frame(width: 200, height: 50)
                        )
                }.sheet(isPresented: $showingSheet) {
                    ClefsPitchedNotesLearnView(isPresented:$showingSheet)
                }
                
                Spacer()
                
                Button(action:{
                    showingSheet1 = true
                }){
                    Text("review")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .padding()
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 3)
                                .frame(width: 200, height: 50)
                        )
                }.sheet(isPresented: $showingSheet1) {
                    ClefsPitchedNotesReviewView(isPresented:$showingSheet1)
                }
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ClefsPitchedNotesView()
}
