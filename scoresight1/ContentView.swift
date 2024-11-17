//haha

import SwiftUI

struct ContentView: View {
    var body: some View {
        @Environment(\.dismiss) var dismiss
        NavigationStack{
            HStack {
                NavigationLink{
                    StartView()
                }label:{
                    Image(systemName: "x.circle")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .font(.system(size:50))
                }
                Spacer()
            }
            // find out how to make the scrollview landscape
            ScrollView {
                VStack(alignment: .center) {
                    NavigationLink{
                        SheetMusicOrganisationView()
                    }label:{
                        Text("sheet music organisation")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding(30)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 500, height: 70)
                            )
                    }
                    NavigationLink{
                        RhythmNotesRestsView()
                    }label:{
                        Text("rhythm notes + rests")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding(30)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 500, height: 70)
                            )
                    }
                    NavigationLink{
                        TimeSignaturesView()
                    }label:{
                        Text("time signatures")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding(30)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 500, height: 70)
                            )
                    }
                    NavigationLink{
                        ClefsPitchedNotesView()
                    }label:{
                        Text("clefs + pitched notes")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding(30)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 500, height: 70)
                            )
                    }
                    NavigationLink{
                        KeySignaturesAccidentalsView()
                    }label:{
                        Text("key signatures + accidentals")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding(30)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 500, height: 70)
                            )
                    }
                    NavigationLink{
                        DynamicsView()
                    }label:{
                        Text("dynamics")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding(30)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 500, height: 70)
                            )
                    }
                    NavigationLink{
                        ArticulationsOrnamentsView()
                    }label:{
                        Text("articulations + ornaments")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding(30)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 500, height: 70)
                            )
                    }
                    NavigationLink{
                        SandboxView()
                    }label:{
                        Text("sandbox")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding(30)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 500, height: 70)
                            )
                    }
                }.frame(maxWidth: .infinity, alignment: .center)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}


#Preview {
    ContentView()
}
