//
//  DynamicsView.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct DynamicsLearnView: View {
    
    @State private var volume = 0.0
    @State private var isEditing = false
    // figure out how to change the slider colour
    
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
            
            if volume <= 14.1 {
                VStack {
                    Image("ppp")
                        .resizable()
                        .scaledToFit()
                    Text("pianississimo")
                        .font(.system(size: 70))
                        .fontWeight(.bold)
                }
            }
            
            else if volume <= 28.3 {
                VStack {
                    Image("pp")
                        .resizable()
                        .scaledToFit()
                    Text("pianissimo")
                        .font(.system(size: 70))
                        .fontWeight(.bold)
                }
            }
            
            else if volume <= 42.5 {
                VStack {
                    Image("piano")
                        .resizable()
                        .scaledToFit()
                    Text("piano")
                        .font(.system(size: 70))
                        .fontWeight(.bold)
                }
            }
            
            else if volume <= 56.7 {
                VStack {
                    Image("mezzopiano")
                        .resizable()
                        .scaledToFit()
                    Text("mezzopiano")
                        .font(.system(size: 70))
                        .fontWeight(.bold)
                }
            }
            
            else if volume <= 70.9 {
                VStack {
                    Image("mezzoforte")
                        .resizable()
                        .scaledToFit()
                    Text("mezzoforte")
                        .font(.system(size: 70))
                        .fontWeight(.bold)
                }
            }
            
            else if volume <= 85.1 {
                VStack {
                    Image("forte")
                        .resizable()
                        .scaledToFit()
                    Text("forte")
                        .font(.system(size: 70))
                        .fontWeight(.bold)
                }
            }
            
            else if volume <= 99.3 {
                VStack {
                    Image("ff")
                        .resizable()
                        .scaledToFit()
                    Text("fortissimo")
                        .font(.system(size: 70))
                        .fontWeight(.bold)
                }
            }
            
            else {
                VStack {
                    Image("fff")
                        .resizable()
                        .scaledToFit()
                    Text("fortississimo")
                        .font(.system(size: 70))
                        .fontWeight(.bold)
                }
            }
            
            Slider(
                value: $volume,
                in: 0...100,
                step: 14.2
            ) {
                Text("volume")
            } minimumValueLabel: {
                Text("soft")
                    .font(.system(size: 30))
            } maximumValueLabel: {
                Text("loud")
                    .font(.system(size: 30))
            } onEditingChanged: { editing in
                isEditing = editing
            }
Text("Play around with the slider to see some common loud and soft dynamics!")
            HStack{
                Spacer()
                NavigationLink{
                    DynamicsLearn2View()
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
    DynamicsLearnView()
}
