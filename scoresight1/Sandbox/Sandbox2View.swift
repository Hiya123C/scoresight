////offset
//
//import SwiftUI
//
//struct Sandbox1View: View {
//    @StateObject private var viewModel = SandboxViewModel()
//    @State private var selectedRestIndex: Int? = nil
//    var body: some View {
//        NavigationStack{
//            VStack{
//                Spacer()
//                HStack{
//                    NavigationLink{
//                        SandboxView()
//                    }label:{
//                        Image(systemName: "x.circle")
//                            .foregroundStyle(.black, .white)
//                            .font(.system(size:50))
//                    }
//                    Spacer()
//                    
//                    Button(action:{ viewModel.resetNotes()
//                    }){
//                        Image(systemName: "repeat.circle.fill")
//                            .foregroundStyle(.black, .white)
//                            .font(.system(size:50))
//                    }
//                }
//                
//                Text("move the note up and down the bar lines to adjust pitch")
//                    .font(.system(size:25))
//                
//                VStack(alignment: .center){
//                    
//                    HStack{
//
//                        ZStack(alignment: .leading) {
//                            HStack(spacing: 0) {
//                                Rectangle()
//                                    .frame(width: 4)
//                                VStack(spacing: 21) {
//                                    Rectangle()
//                                        .frame(height: 4)
//                                    Rectangle()
//                                        .frame(height: 4)
//                                    Rectangle()
//                                        .frame(height: 4)
//                                    Rectangle()
//                                        .frame(height: 4)
//                                    Rectangle()
//                                        .frame(height: 4)
//                                }
//                                Rectangle()
//                                    .frame(width: 4)
//                            }
//                            .frame(height: 104)
//                            
//                            HStack(spacing: 36) {
//                                HStack(spacing: 4) {
//                                    Image("single treble")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 160)
//                                        .padding(.leading, 8)
//                                    
//                                    Image("common time")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 48)
//                                }
//                                
//                                HStack(spacing: 0) {
//                                    ForEach(viewModel.noteImages.indices, id: \.self) { index in
//                                        Image(viewModel.noteImages[index])
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 32)
//                                            .background(viewModel.selectedRestIndex == index ? Color.yellow.opacity(0.3) : Color.clear)
//                                            .onTapGesture {
//                                                viewModel.toggleSelectNote(at: index)
//                                            }
//                                        
//                                        ForEach(0..<viewModel.notes[index].NoteLength.lengthMultiplier, id: \.self) { _ in
//                                            Spacer()
//                                        }
//                                    }
//                                }
//                            }
//                            
//                            
////                            ForEach(viewModel.notes) { note in
////                                Image(note.type)
////                                    .frame(width:50)
////                                    .scaledToFit()
////                                    .position(note.position)
////                                    .gesture(
////                                        DragGesture()
////                                            .onChanged { value in
////                                                viewModel.updatePitch(for: note, at: value.location)
////                                            }
////                                    )
////                            }
//                            
//                        }
//                        
//                        Button(action:{
//                            print("play line")
//                            //play
//                        }){
//                            Image(systemName: "play.square")//looks abit ugly...
//                                .foregroundStyle(.black, .black)
//                                .font(.system(size:60))
//                        }
//                        
//                    }
//                }.frame(maxWidth:.infinity, alignment: .center)
//                
//                Spacer()
//                
//                HStack{ //3 note values
//                    Spacer()
//                    Button(action: {
//                        viewModel.replaceNote(with: "minim")
//                    }) {
//                        Image("minim")
//                            .resizable()
//                            .scaledToFit()
//                            .scaleEffect(0.6)
//                            .background(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.black, lineWidth: 3)
//                                    .frame(width: 80, height: 90)
//                            )
//                    }
//                    Spacer()
//                    Button(action:{
//                        viewModel.replaceNote(with: "crochet")
//                    }){
//                        Image("crochet")
//                            .resizable()
//                            .scaleEffect(0.5)
//                            .scaledToFit()//haha :(
//                            .background(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.black, lineWidth: 3)
//                                    .frame(width:80,height:90)
//                            )
//                    }
//                    Spacer()
//                    
//                    Button(action: {
//                        viewModel.replaceNote(with: "quaver")
//                    }) {
//                        Image("quaver")
//                            .resizable()
//                            .scaledToFit()
//                            .scaleEffect(0.6)
//                            .background(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.black, lineWidth: 3)
//                                    .frame(width: 80, height: 90)
//                            )
//                    }
//                    Spacer()
//                }
//            }.navigationBarBackButtonHidden(true)
//        }
//    }
//}
//
//
//#Preview {
//    Sandbox1View()
//}
