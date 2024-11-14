//
//  SheeMusicOrganisationReview6View.swift
//  scoresight1
//
//  Created by Crystal on 14/11/24.
//

import SwiftUI

struct SheeMusicOrganisationReview6View: View {
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
                    Text("exit")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 3)
                                .frame(width: 100, height: 50)
//                                .fill(Color.red)
                        )
                        .frame(width: 100, height: 50)
                        .foregroundStyle(.black)
                        .font(.system(size: 25))
                    
                    
                    
                    
                }
                Spacer()
            }
        }
    }
}

#Preview {
    SheeMusicOrganisationReview6View()
}
