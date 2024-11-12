//
//  ArticulationsOrnamentsLearn14View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct ArticulationsOrnamentsLearn14View: View {
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
                //                Image("acciacatura")
                //                    .resizable()
                //                    .scaledToFit()
                VStack(alignment: .trailing) {
                    Text("this is an")
                        .font(.system(size: 40))
                    Text("acciacatura")
                        .font(.system(size:80))
                        .bold()
                }
            }
            HStack{
                NavigationLink{
                    ArticulationsOrnamentsLearn13View()
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
                    ArticulationsOrnamentsReviewView()
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
    ArticulationsOrnamentsLearn14View()
}
