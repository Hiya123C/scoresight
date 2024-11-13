//find a way to only move the note values + keep content
//find a way to make crotchet rests smaller, note options larger

import SwiftUI

struct Sandbox1View: View {
    @State private var currentStage: Int = 1
    @StateObject private var viewModel = SandboxViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                Spacer(minLength: 70)
                HStack{
                    NavigationLink{
                        SandboxView()
                    }label:{
                        Image(systemName: "x.circle")
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                    
                    Button(action:{
                        //reset all changes
                        viewModel.replaceRest(with: "default")
                    }){
                        Image(systemName: "repeat.circle.fill")
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    
                }
                
                Text("move the note up and down the bar lines to adjust pitch")
                    .font(.system(size:25))
                
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        ZStack{
                            Image("sandbox original")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(1)
                            
                            VStack{
                                HStack{
                                    //**
                                    ForEach(viewModel.restImages, id: \.self) { restImage in
                                        Image(restImage)
                                            .resizable()
                                            .scaledToFill()
                                            .scaleEffect(restImage == "minim rest" ? 0.1 : 0.8)
                                            .scaleEffect(restImage == "quaver rest" ? 0.4 : 0.8)
                                        //**
                                    }
                                }.frame(maxWidth:400, maxHeight: 280) //allowed?
                                Spacer()
                            }
                            //*
                            ForEach(viewModel.notes) { note in
                                    Image(note.type)
                                        .resizable()
                                        .scaledToFit()
                                        .position(note.position)
                                        .gesture(
                                            DragGesture()
                                                .onChanged { value in
                                                    viewModel.updatePitch(for: note, at: value.location)
                                                }
                                        )
                                } //haha
                            //*
                            
                        }
                        Spacer()
                        Button(action:{
                            print("play line")
                            //play
                        }){
                            Image(systemName: "play.square")//looks abit ugly...
                                .foregroundStyle(.black, .black)
                                .font(.system(size:60))
                        }
                    }
                    Spacer()
                }.frame(maxHeight:.infinity)
                
                Spacer()
                
                if currentStage == 1{
                    HStack{ //3 note values
                        Spacer()
                        Button(action: {
                            viewModel.replaceRest(with: "minim")
                        }) {
                            Image("minim")
                                .resizable()
                                .scaledToFit()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 3)
                                        .frame(width: 80, height: 90)
                                )
                        }
                        Spacer()
                        Button(action:{
                            viewModel.replaceRest(with:"default")
                        }){
                            Image("crochet")
                                .resizable()
                                .scaledToFit()//haha :(
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 3)
                                        .frame(width:80,height:90)
                                )
                        }
                        Spacer()
                        
                        Button(action: {
                            viewModel.replaceRest(with: "quaver")
                        }) {
                            Image("quaver")
                                .resizable()
                                .scaledToFit()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 3)
                                        .frame(width: 80, height: 90)
                                )
                        }
                        Spacer()
                    }
                }else if currentStage == 2{
                    HStack{
                        Spacer()
                        Button(action:{
                            
                        }) {
                            Image("natural")
                                .resizable()
                                .scaledToFit()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 3)
                                        .frame(width: 80, height: 90)
                                )
                        }
                        Spacer()
                        Button(action:{
                        }) {
                            Image("sharp")
                                .resizable()
                                .scaledToFit()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 3)
                                        .frame(width: 80, height: 90)
                                )
                        }
                        Spacer()
                        Button(action:{
                            
                        }) {
                            Image("flat")
                                .resizable()
                                .scaledToFit()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 3)
                                        .frame(width: 80, height: 90)
                                )
                        }
                        Spacer()
                    }
                }
                
                HStack{
                    if currentStage == 2 {
                            Button("back") {
                                currentStage = 1
                            }
                            .padding()
                            .foregroundStyle(.black)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                            .font(.system(size: 25))
                        }

                        Spacer()
                        
                        if currentStage == 1 {
                            Button("next") {
                                currentStage = 2
                            }
                            .padding()
                            .foregroundStyle(.black)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                            .font(.system(size: 25))
                        }
                    
                }
                Spacer(minLength: 50)
                
                
            }//1st vstack
        }//nav stack
    }
}

#Preview {
    Sandbox1View()
}
