//
//  SheetMusicOrganisationLearn2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct SheetMusicOrganisationLearn2View: View {
    
    @State private var isFullScreenPresented = false
    @State private var isFullScreenPresented2 = false
    @State private var isFullScreenPresented3 = false
    
    var body: some View {
        VStack{
            Button(action:{print("hehe")
                isFullScreenPresented = true
            }){
                Image(systemName: "x.circle")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.black, .white)
                    .font(.system(size:50))
                    .position(x:0,y:50)//find out how to replace position
            }
            
            HStack(alignment: .center){ //the photo no movee.
                Image("clefs")
                    .resizable()
                    .frame(width: 500, height: 250, alignment: .bottom)
                    .position(x:300,y:50)
                
                 //position?
                VStack{
                    Text("these are")
                        .font(.system(size: 40))
                    Text("clefs")
                        .font(.system(size:80))
                        .bold()

                }
            }
            
            
            
            HStack{
                Button(action: {
                    isFullScreenPresented2 = true
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
                    isFullScreenPresented3 = true
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
        .fullScreenCover(isPresented: $isFullScreenPresented) {
            SheetMusicOrganisationView()
        }
        .fullScreenCover(isPresented: $isFullScreenPresented2) {
            SheetMusicOrganisationLearnView()
        }
        .fullScreenCover(isPresented: $isFullScreenPresented3) {
            SheetMusicOrganisationLearn3View()
        }
    }
}

#Preview {
    SheetMusicOrganisationLearn2View()
}
