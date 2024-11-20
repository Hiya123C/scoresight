//so weird.**

import SwiftUI

struct SheetMusicOrganisationReview2View: View {
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
                
                VStack{
                    Image("single bar")
                        .resizable()
                        .scaledToFit()
                    
                    Spacer()
                    
                    HStack{
                        Image("44")
                            .resizable()
                            .scaledToFit()
                        
                        Image("single treble") //make larger
                            .resizable()
                            .scaledToFit()
                        
                        Image("single tempo") //make smaller
                            .resizable()
                            .scaledToFit()
                        
                        Image("flat")
                            .resizable()
                            .scaledToFit()
                    }
                    
                    
                }
                
                Spacer()
                
                HStack{
                    Spacer()
                    
                    NavigationLink{
                        SheetMusicOrganisationReview3View()
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
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SheetMusicOrganisationReview2View()
}
