//to-dos
//note function
//are accidentals needed?
//be able to drag the note up and down + stave moves accordingly
//link note position to its pitch

import SwiftUI

struct Sandbox1View: View {
    @State private var currentStage: Int = 1
    @StateObject private var viewModel = SandboxViewModel()
//    @State private var selectedRestIndex: Int? = nil
    
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
                    
                    Button(action:{                        viewModel.resetRests()
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
                                    //                                    ForEach(viewModel.restImages, id: \.self) { restImage in
                                    //                                        Image(restImage)
                                    //                                            .resizable()
                                    //                                            .scaledToFill()
                                    //                                            .scaleEffect(restImage == "minim rest" ? 0.25 : 0.8)
                                    //                                            .scaleEffect(restImage == "quaver rest" ? 0.4 : 0.8)
                                    //                                            .scaleEffect(restImage == "crochet" ? 0.55 : 0.8)
                                    //**
                                    
                                    ForEach(viewModel.restImages.indices, id: \.self) { index in
                                        Image(viewModel.restImages[index])
                                            .resizable()
                                            .scaledToFill()
                                            .scaleEffect(viewModel.restImages[index] == "minim rest" ? 0.25 : 0.8)
                                            .scaleEffect(viewModel.restImages[index] == "quaver rest" ? 0.4 : 0.8)
                                            .padding()
                                            .background(viewModel.selectedRestIndex == index ? Color.yellow.opacity(0.3) : Color.clear)
                                            .onTapGesture {
                                                viewModel.toggleSelectRest(at: index)
                                            }
                                    }
                                }.frame(maxWidth:370, maxHeight: 280) //allowed?
                                Spacer()
                            }
                            //*
                            //                            ForEach(viewModel.notes) { note in
                            //                                Image(note.type)
                            //                                    .resizable()
                            //                                    .scaledToFit()
                            //                                    .position(note.position)
                            //                                    .gesture(
                            //                                        DragGesture()
                            //                                            .onChanged { value in
                            //                                                viewModel.updatePitch(for: note, at: value.location)
                            //                                            }
                            //                                    )
                            //                            } //haha
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
                            }
                            
                        }
                        Spacer()
                        VStack{
                            Button(action:{
                                viewModel.beatChange(with:"note")
                            }){
                                Text("note")
                                    .padding()
                                    .foregroundStyle(.black)
                                    .background(
                                        RoundedRectangle(cornerRadius: 7)
                                            .stroke(.black, lineWidth: 2)
                                            .frame(width: 50, height: 50)
                                    )
                                    .font(.system(size: 20))
                                
                            }
                            
                            Button(action:{
                                print("play line")
                                //play
                            }){
                                Image(systemName: "play.square")//looks abit ugly...
                                    .foregroundStyle(.black, .black)
                                    .font(.system(size:60))
                            }
                        }
                    }
                    Spacer()
                }.frame(maxHeight:.infinity)
                
                Spacer()
                
                if currentStage == 1{
                    HStack{ //3 note values
                        Spacer()
                        Button(action: {
                            viewModel.replaceSelectedRest(with: "minim")
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
                            viewModel.replaceSelectedRest(with: "crochet")
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
                            viewModel.replaceSelectedRest(with: "quaver")
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
                }else if currentStage == 2{//accidentals?
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
                
            }.navigationBarBackButtonHidden(true)
        }//nav stack
    }
}

#Preview {
    Sandbox1View()
}
