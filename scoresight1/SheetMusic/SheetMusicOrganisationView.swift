//


import SwiftUI

struct SheetMusicOrganisationView: View {    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Text("sheet music\norganisation")
                    .fontWeight(.bold)
                    .font(.system(size:100)).environment(\._lineHeightMultiple, 0.75)
                Spacer()
                
                NavigationLink{
                    SheetMusicOrganisationLearn1View()
                }label:{
                    Text("learn")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .bold()
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 3)
                                .frame(width: 200, height: 50)
                        )
                }
                
                Spacer()
                
                NavigationLink{
                    SheetMusicOrganisationReviewView()
                }label:{
                    Text("review")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .bold()
                        .overlay(
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
