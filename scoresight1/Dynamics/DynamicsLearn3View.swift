//
//  DynamicsLearn3View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct DynamicsLearn3View: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    NavigationLink{
                        DynamicsView()
                    } label:{
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                Image("decrescendo")
                    .resizable()
                    .scaledToFit()
                Text("gradually getting softer")
                    .font(.system(size: 25))
                Text("decrescendo")
                    .font(.system(size:80))
                    .bold()
                HStack{
                    NavigationLink{
                        DynamicsLearn2View()
                    } label:{
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
                        DynamicsLearn4View()
                    } label:{
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
}

#Preview {
    DynamicsLearn3View()
}
