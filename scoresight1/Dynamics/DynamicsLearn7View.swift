//
//  DynamicsLearn7.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct DynamicsLearn7View: View {
    var body: some View {
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
            Image("pianoforte")
              .resizable()
              .scaledToFit()
            Text("softly then immediately loudly")
                .font(.system(size: 25))
            Text("pianoforte")
                .font(.system(size:80))
                .bold()
            HStack{
                NavigationLink{
                    DynamicsLearn6View()
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
                    DynamicsLearn8View()
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

#Preview {
    DynamicsLearn7View()
}
