//
//  SandboxView.swift
//  scoresight1
//
//  Created by Crystal on 9/11/24.
//

import SwiftUI

struct SandboxView: View {
    
    @State private var isFullScreenPresented = false
    
    var body: some View {
        VStack {
                   Text("sandbox")
                       .fontWeight(.bold)
                       .font(.system(size: 100))
                       .multilineTextAlignment(.center)



                   Button(action: {
                       isFullScreenPresented = true
                   }) {
                       Text("start")
                           .bold()
                           .padding()
                           .buttonStyle(.borderedProminent)
                           .overlay(
                               RoundedRectangle(cornerRadius:15)
                                   .stroke(.black,lineWidth:3)
                                   .frame(width:200, height:50)
                           )
                           .foregroundStyle(.black)
                           .font(.system(size: 30))
                   }
               }

               .fullScreenCover(isPresented: $isFullScreenPresented) {
                   Sandbox2View()
               }
    }
}



#Preview {
    SandboxView()
}
