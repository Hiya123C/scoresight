//
//  ArticulationsOrnamentsLearn3View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct ArticulationsOrnamentsLearn3View: View {
    var body: some View {
        VStack {
            HStack {
                Button(action:{
                    
                }){
                    Image(systemName: "x.circle")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .font(.system(size:50))
                }
                Spacer()
            }
            
            HStack {
//                Image("trill")
//                    .resizable()
//                    .scaledToFit()
                VStack(alignment: .trailing) {
                    Text("this is a")
                        .font(.system(size: 40))
                    Text("trill")
                        .font(.system(size:80))
                        .bold()
                }
            }
            HStack{
                Button(action: {
                    
                })
                {
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
                Button(action: {
                    
                })
                {
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
    ArticulationsOrnamentsLearn3View()
}
