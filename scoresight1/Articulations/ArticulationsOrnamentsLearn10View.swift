//
//  ArticulationsOrnamentsLearn10View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct ArticulationsOrnamentsLearn10View: View {
    var body: some View {
        VStack {
            HStack {
                NavigationLink{
                    ArticulationsOrnamentsView()
                }label:{
                    Image(systemName: "x.circle")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .font(.system(size:50))
                }
                Spacer()
            }
            
            HStack {
//                Image("portato")
//                    .resizable()
//                    .scaledToFit()
                VStack(alignment: .trailing) {
                    Text("this is a")
                        .font(.system(size: 40))
                    Text("portato")
                        .font(.system(size:80))
                        .bold()
                }
            }
            HStack{
                NavigationLink{
                    ArticulationsOrnamentsLearn9View()
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
                    ArticulationsOrnamentsLearn11View()
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
    ArticulationsOrnamentsLearn10View()
}
