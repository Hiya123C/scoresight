//
//  ClefsPitchedNotesReview5View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 14/11/24.
//

import SwiftUI

struct ClefsPitchedNotesReview5View: View {
    var body: some View {
        VStack{
            NavigationStack{
                Spacer()
                Text("Great job!")
                    .font(.system(size: 100))
                    .bold()
                
                
                Spacer()
                    NavigationLink{
                        ContentView()
                    }label:{
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 100, height: 50)
                                .foregroundStyle(.red)
                            
                            Text("exit")
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
                    Spacer()
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ClefsPitchedNotesReview5View()
}
