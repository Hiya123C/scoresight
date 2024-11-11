//scroll view portrait

import SwiftUI

struct ContentView: View {
    
    @State private var isFullScreenPresented1 = false
    @State private var isFullScreenPresented2 = false
    @State private var isFullScreenPresented3 = false
    @State private var isFullScreenPresented4 = false
    @State private var isFullScreenPresented5 = false
    @State private var isFullScreenPresented6 = false
    @State private var isFullScreenPresented7 = false
    @State private var isFullScreenPresented8 = false
    
    var body: some View {
        ScrollView {
            Button(action: {
                isFullScreenPresented1 = true
            }) {
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
            Button(action: {
                isFullScreenPresented2 = true
            }) {
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
            Button(action: {
                isFullScreenPresented3 = true
            }) {
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
            Button(action: {
                isFullScreenPresented4 = true
            }) {
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
            Button(action: {
                isFullScreenPresented5 = true
            }) {
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
            Button(action: {
                isFullScreenPresented6 = true
            }) {
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
            Button(action: {
                isFullScreenPresented7 = true
            }) {
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
            Button(action: {
                isFullScreenPresented8 = true
            }) {
            Text("sandbox")
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
        }
        .fullScreenCover(isPresented: $isFullScreenPresented1) {
            SheetMusicOrganisationView()
                }
        .fullScreenCover(isPresented: $isFullScreenPresented2) {
            RhythmNotesRestsView()
                }
        .fullScreenCover(isPresented: $isFullScreenPresented3) {
            TimeSignaturesView()
                }
        .fullScreenCover(isPresented: $isFullScreenPresented4) {
            ClefsPitchedNotesView()
                }
        .fullScreenCover(isPresented: $isFullScreenPresented5) {
//            KeySignaturesAccidentalsView()
                }
        .fullScreenCover(isPresented: $isFullScreenPresented6) {
            DynamicsView()
                }
        .fullScreenCover(isPresented: $isFullScreenPresented7) {
            ArticulationsOrnamentsView()
                }
        .fullScreenCover(isPresented: $isFullScreenPresented8) {
            SandboxView()
                }
    }
}


#Preview {
    ContentView()
}
