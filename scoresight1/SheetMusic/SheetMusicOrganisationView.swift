//


import SwiftUI

struct SheetMusicOrganisationView: View {
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    NavigationLink{
                        ContentView()
                    } label:{
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
                    Text("sheet music\norganisation")
                        .fontWeight(.bold)
                        .font(.system(size:50)).environment(\._lineHeightMultiple, 0.75)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                
                NavigationLink{
                    SheetMusicOrganisationLearnView()
                }label:{
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
                }
                
                Spacer()
                
                NavigationLink{
                    SheetMusicOrganisationReview1View()
                }label:{
                    Text("review")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 3)
                                .frame(width: 200, height: 50)
                        )
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
