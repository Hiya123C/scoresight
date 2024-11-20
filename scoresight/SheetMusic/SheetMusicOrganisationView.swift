//

import SwiftUI

struct SheetMusicOrganisationView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingSheet = false
    @State private var showingSheet1 = false
    var body: some View {
        NavigationStack{
            VStack {
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
                }
                Spacer()
                ViewThatFits{
                    Text("sheet music\norganisation")
                        .fontWeight(.bold)
                        .font(.system(size:100)).environment(\._lineHeightMultiple, 0.75)
                        .multilineTextAlignment(.center)
                    Text("sheet music\norganisation")
                        .fontWeight(.bold)
                        .font(.system(size:80)).environment(\._lineHeightMultiple, 0.75)
                        .multilineTextAlignment(.center)
                    
                    Text("sheet music\norganisation")
                        .fontWeight(.bold)
                        .font(.system(size:60)).environment(\._lineHeightMultiple, 0.75)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                
                Button(action:{
                    showingSheet = true
                }){
                    Text("learn")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .padding()
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 3)
                                .frame(width: 200, height: 50)
                        )
                }.sheet(isPresented: $showingSheet) {
                    SheetMusicOrganisationLearnView(isPresented: $showingSheet)
                }
                
                Spacer()
                
                Button(action:{
                    showingSheet1 = true
                }){
                    Text("review")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .padding()
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 3)
                                .frame(width: 200, height: 50)
                        )
                }.sheet(isPresented: $showingSheet1) {
                    SheetMusicOrganisationReview1View(isPresented:$showingSheet1)
                }
                
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    SheetMusicOrganisationView()
}
