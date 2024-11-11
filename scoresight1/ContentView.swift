//scroll view portrait

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            Button(action: {
                
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
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    ContentView()
}
