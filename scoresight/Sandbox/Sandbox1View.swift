//connection to play.. length/time of notes
//timer av foundation

import SwiftUI

struct Sandbox1View: View {
    @StateObject private var viewModel = SandboxViewModel()
    @StateObject private var audioManager = AudioManager()
    @State private var selectedRestIndex: Int? = nil
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Button(action:{
                        dismiss()
                    }){
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
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
                
                VStack(alignment: .center){
                    ScrollView(.horizontal){
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
                                            Image(
                                                viewModel.notes[index].NoteLength == .quaver && viewModel.notes[index].flipped ? "flipped quaver" :
                                                    viewModel.notes[index].NoteLength == .crochet && viewModel.notes[index].flipped ? "flipped crochet" :
                                                    viewModel.notes[index].NoteLength == .minim && viewModel.notes[index].flipped ? "flipped minim" :
                                                    viewModel.noteImages[index]
                                                
                                            )
                                            .resizable()
                                            .scaledToFit()
                                            .frame(
                                                width: viewModel.notes[index].NoteLength == .quaver ? 90 : 48, // Resize quaver notes only
                                                height: viewModel.notes[index].NoteLength == .quaver ? 100 : nil
                                            ) //control size of notes
                                            .padding(.trailing, 36 * Double(viewModel.notes[index].NoteLength.lengthMultiplier)) //moves notes to right
                                            
                                            .offset(y: viewModel.notes[index].position.y +
                                                    (viewModel.notes[index].flipped ? 78:0)
                                            )
                                            .gesture(
                                                DragGesture()
                                                    .onEnded{ value in
                                                        if value.translation.height > 20 {
                                                                                                                  if viewModel.notes[index].position.y < 24 {
                                                                
                                                                viewModel.notes[index].position.y += 12.8
                                                            }
                                                            
                                                        } else if value.translation.height < -10 {
                                                        
                                                            if viewModel.notes[index].position.y > -96 {
                                                                viewModel.notes[index].position.y -= 12.8
                                                            }
                                                    }
                                                }
                                            )
                                            ForEach(0..<viewModel.notes[index].NoteLength.lengthMultiplier, id: \.self) { _ in
                                                //spacing in between notes
                                            }
                                        }
                                    }
                                }
                            }
                            
                            Button(action: {
                                print("play line")
                                var delay: Double = 0.0 
                                    
                                    for note in viewModel.notes {
                                        let pitch = note.pitch
                                        let duration = note.NoteLength.timeMultiplier
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                                            audioManager.playSound(for: pitch, duration: duration)
                                        }
                                        
                                        delay += duration
                                    }
                            }) {
                                Image(systemName: "play.square")
                                    .foregroundStyle(.black, .black)
                                    .font(.system(size: 60))
                            }

                        }.frame(maxWidth:.infinity, alignment: .center)
                    }
                    
                    Spacer()
                    
                    HStack{ //3 note values
                        Spacer()
                        Button(action: {
                            viewModel.replaceNote(with: "minim")
                        }) {
                            Image("minim 1")
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
                            Image("crochet 1")
                                .resizable()
                                .scaleEffect(0.6)
                                .scaledToFit()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 3)
                                        .frame(width: 80, height: 90), alignment: .center)
                        }
                        Spacer()
                        
                        Button(action: {
                            viewModel.replaceNote(with: "quaver")
                        }) {
                            Image("quaver 2")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.6)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 3)
                                        .frame(width: 80, height: 90), alignment: .center)
                        }
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
