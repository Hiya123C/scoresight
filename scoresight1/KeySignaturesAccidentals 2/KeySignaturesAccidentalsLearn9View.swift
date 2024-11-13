//
//  KeySignaturesAccidentalsLearn9View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsLearn9View: View {
    
    let sharps = ["B", "E", "A", "D", "G", "C", "F"]
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    // ask how to make them appear at a specific place
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink{
                    KeySignaturesAccidentalsView()
                } label:{
                    Image(systemName: "x.circle")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .font(.system(size:50))
                }
                Spacer()
            }
            
            ZStack {
                Image("bass flats")
                    .resizable()
                    .scaledToFit()
                HStack {
                    ForEach(0...counter, id: \.self) { index in
                        Text(sharps[index])
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.blue)
                    }
                }
                .onReceive(timer) { _ in
                    withAnimation {
                        if counter < sharps.count - 1 {
                            counter = counter + 1
                        } else {
                            timer.upstream.connect().cancel()
                        }
                    }
                }
            }
            
            HStack{
                NavigationLink{
                    KeySignaturesAccidentalsLearn8View()
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
                    KeySignaturesAccidentalsLearn10View()
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
    KeySignaturesAccidentalsLearn9View()
}
