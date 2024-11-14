//to-dos
//note function
//are accidentals needed?
//be able to drag the note up and down + stave moves accordingly
//link note position to its pitch

import SwiftUI

struct Sandbox1View: View {
    @StateObject private var viewModel = SandboxViewModel()
    @State private var selectedRestIndex: Int? = nil
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                HStack{
                    NavigationLink{
                        SandboxView()
                    }label:{
                        Image(systemName: "x.circle")
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                    
                    Button(action:{ viewModel.resetNotes()
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
                                    ForEach(viewModel.noteImages.indices, id: \.self) { index in
                                        Image(viewModel.noteImages[index])
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 70)
                                            .padding()
                                            .background(viewModel.selectedRestIndex == index ? Color.yellow.opacity(0.3) : Color.clear)
                                            .onTapGesture {
                                                viewModel.toggleSelectNote(at: index)
                                            }
                                    }
                                }.frame(maxWidth:370, maxHeight: 280) //allowed?
                                Spacer()
                            }
                            
//                            
//                            ForEach(viewModel.notes) { note in
//                                Image(note.type)
//                                    .frame(width:50)
//                                    .scaledToFit()
//                                    .position(note.position)
//                                    .gesture(
//                                        DragGesture()
//                                            .onChanged { value in
//                                                viewModel.updatePitch(for: note, at: value.location)
//                                            }
//                                    )
//                            }
                            
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
                
                HStack{ //3 note values
                    Spacer()
                    Button(action: {
                        viewModel.replaceNote(with: "minim")
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
                        viewModel.replaceNote(with: "crochet")
                    }){
                        Image("crochet")
                            .resizable()
                            .scaleEffect(1.1)
                            .scaledToFit()//haha :(
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width:80,height:90)
                            )
                    }
                    Spacer()
                    
                    Button(action: {
                        viewModel.replaceNote(with: "quaver")
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
            }.navigationBarBackButtonHidden(true)
        }
    }
}


#Preview {
    Sandbox1View()
}
