//offset done
//connection to play

import SwiftUI

struct Sandbox1View: View {
    @StateObject private var viewModel = SandboxViewModel()
    @State private var selectedRestIndex: Int? = nil
    var body: some View {
        NavigationStack{
            VStack{
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
                
                VStack(alignment: .center){                    ScrollView(.horizontal){
                        HStack{
                            ZStack(alignment: .leading) {
                                BarView()
                                
                                HStack(spacing: 36) {
                                    HStack(spacing: 4) {
                                        Image("single treble")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 160)
                                            .padding(.leading, 8)
                                        
                                        Image("common time")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 48)
                                    }
                                    HStack(spacing: 0) {
                                        ForEach(viewModel.noteImages.indices, id: \.self) { index in
                                            Image(viewModel.noteImages[index])
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 68) //control size of notes
                                            //                                                .scaleEffect(x: viewModel.notes[index].position.y <= -46 ? -1 : 1,
                                            //                                                             y: viewModel.notes[index].position.y <= -46 ? -1 : 1) //fliping
                                                .offset(y: viewModel.notes[index].position.y)
                                                .gesture(
                                                    DragGesture()
                                                        .onChanged { value in //dragged at 12 points.
                                                            var verticalPosition = round(value.translation.height / 12) * 12
                                                            
                                                            verticalPosition = min(max(verticalPosition, -97), 24)
                                                            
                                                            viewModel.notes[index].position.y = verticalPosition
                                                        }
                                                )
                                            
                                            // Add spacing based on note length multiplier
                                            ForEach(0..<viewModel.notes[index].NoteLength.lengthMultiplier, id: \.self) { _ in
                                                Spacer()
                                            }
                                        }
                                    }
                                    
                                }
                                
                                
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
                            
                            Button(action:{
                                print("play line")
                                //play
                            }){
                                Image(systemName: "play.square")//looks abit ugly...
                                    .foregroundStyle(.black, .black)
                                    .font(.system(size:60))
                                
                            }
                        }.frame(maxWidth:.infinity, alignment: .center)
                    }
                    
                    Spacer()
                    
                    HStack{ //3 note values
                        Spacer()
                        Button(action: {
                            viewModel.replaceNote(with: "minim")
                        }) {
                            Image("minim")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.6)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 3)
                                        .frame(width: 80, height: 90), alignment: .center)
                        }
                        Spacer()
                        Button(action:{
                            viewModel.replaceNote(with: "crochet")
                        }){
                            Image("crochet")
                                .resizable()
                                .scaleEffect(0.5)
                                .scaledToFit()//haha :(
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 3)
                                        .frame(width: 80, height: 90), alignment: .center)
                        }
                        Spacer()
                        
                        Button(action: {
                            viewModel.replaceNote(with: "quaver")
                        }) {
                            Image("quaver")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.6)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 3)
                                        .frame(width: 80, height: 90), alignment: .center)                        }
                        Spacer()
                    }
                }
            }.navigationBarBackButtonHidden(true)
        }
    }
}


#Preview {
    Sandbox1View()
}
