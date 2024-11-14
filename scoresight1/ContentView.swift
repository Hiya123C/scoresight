//scroll view portrait

import SwiftUI

struct ContentView: View {
    var body: some View {
        
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
                NavigationStack{
                    NavigationLink{
                        SheetMusicOrganisationView()
                    }label:{
                        Text("sheet music organisation")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 350, height: 55)
                            )
                    }
                    NavigationLink{
                        RhythmNotesRestsView()
                    }label:{
                        Text("rhythm notes + rests")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 350, height: 55)
                            )
                    }
                    NavigationLink{
                        TimeSignaturesView()
                    }label:{
                        Text("time signatures")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 350, height: 55)
                            )
                    }
                    NavigationLink{
                        ClefsPitchedNotesView()
                    }label:{
                        Text("clefs + pitched notes")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 350, height: 55)
                            )
                    }
                    NavigationLink{
                        KeySignaturesAccidentalsView()
                    }label:{
                        Text("key signatures + accidentals")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 350, height: 55)
                            )
                    }
                    NavigationLink{
                        DynamicsView()
                    }label:{
                        Text("dynamics")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 350, height: 55)
                            )
                    }
                    NavigationLink{
                        ArticulationsOrnamentsView()
                    }label:{
                        Text("articulations + ornaments")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 350, height: 55)
                            )
                    }
                    NavigationLink{
                        SandboxView()
                    }label:{
                        Text("sandbox")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .bold()
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 350, height: 55)
                            )
                    }
                }
                
            }.frame(maxWidth: .infinity, alignment: .center)
                .navigationBarBackButtonHidden(true)
        }
    }
}


#Preview {
    ContentView()
}
