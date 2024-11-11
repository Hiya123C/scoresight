//is there a way to maintain what user is creating (line) when they click next (ie: only move the options below)
//might need mvvm?

import SwiftUI

struct Sandbox2View: View {
    
    @State private var isFullScreenPresented = false
    
    var body: some View {
        ZStack{
            VStack{
                HStack(alignment: .top ){
                    VStack{
                        Button(action:{ //click any top, button also can work :(
                            print("im working")
                            isFullScreenPresented = true
                        }){
                            Image(systemName: "x.circle")
                                .foregroundStyle(.black, .white)
                                .font(.system(size:50))
                                .position(x:0,y:50)
                        }
                        
                        Text("move the note up and down the bar lines to adjust pitch")
                            .padding()
                            .font(.system(size:25))
                            .position(x:380, y:-20)
                        
                    }
                    .fullScreenCover(isPresented: $isFullScreenPresented) {
                        SandboxView()
                    }
                }
                
                VStack{
                    HStack{ //main content
                        Image("sandbox original")
                            .resizable()
                            .frame(width: 650, height: 190, alignment: .center)
                            .padding()
                        
                        Button(action:{
                            print("play line")
                            //play
                        }){
                            Image(systemName: "play.square")//looks abit ugly...
                                .foregroundStyle(.black, .black)
                                .font(.system(size:70))
                        }
                    }
                }
                .position(x:370,y:20)
                
                HStack{
                    Spacer()
                    Button(action: {})
                    {
                        Text("next") //perharps change to arrow?
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
//crotchet vs minim vs quaver space restriction
//when selected, note/rest become blue
//when
            VStack{
                Spacer()
                Spacer()
                Spacer()
                HStack(alignment:.bottom){
                    Spacer()
                    Spacer()
                    Spacer()
                    Image("crochet rest")
                        .resizable()
                        .frame(width: 65, height: 110, alignment: .center)
                    Spacer()
                    Image("crochet rest")
                        .resizable()
                        .frame(width: 65, height: 110, alignment: .center)
                    Spacer()
                    Image("crochet rest")
                        .resizable()
                        .frame(width: 65, height: 110, alignment: .center)
                    Spacer()
                    Image("crochet rest")
                        .resizable()
                        .frame(width: 65, height: 110, alignment: .center)
                    Spacer()
                    Spacer()
                    Spacer()
                }
                Spacer()
                HStack{
                    //add the note values (3)
                    Spacer()
                    Button(action:{
                        print("minim.")
                    }){
                        Image("minim")
                            .resizable()
                            .frame(width: 70, height: 120, alignment: .center)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width:100,height:120)
                                )
                    }
                    Spacer()
                    Spacer()
                    Button(action:{
                        print("crochet.")
                    }){
                        Image("crochet")
                            .resizable()
                            .frame(width: 35, height: 100, alignment: .center)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width:100,height:120)
                                )
                    }
                    Spacer()
                    Spacer()
                    
                    Button(action:{
                        print("quaver.")
                    }){
                        Image("quaver")
                            .resizable()
                            .frame(width: 80, height: 110, alignment: .center)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width:100,height:120)
                                )
                    }
                    Spacer()
                    Spacer()
                    
                }
            }
        }
    }
}




#Preview {
    Sandbox2View()
}
