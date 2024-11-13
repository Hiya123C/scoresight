//so weird.**

import SwiftUI

struct SheetMusicOrganisationReview1View: View {
    var body: some View {
        VStack {
            NavigationStack{
                HStack{
                    NavigationLink{
                        SheetMusicOrganisationView()
                    } label:{
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                Spacer()
                Text("test your\nknowledge!")
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .font(.system(size:100)).environment(\._lineHeightMultiple, 0.75)
                Spacer()
            }
            
            HStack{
                
                Spacer()
                
                NavigationLink{
                    SheetMusicOrganisationReview2View()
                }label:{
                    Text("next")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 3)
                                .frame(width:100,height:50)
                            
                        )
                        .foregroundStyle(.black)
                        .font(.system(size: 25))
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SheetMusicOrganisationReview1View()
}
