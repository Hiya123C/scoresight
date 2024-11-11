//

import SwiftUI

struct SheetMusicOrganisationLearn5View: View {
    
    
    var body: some View {
        VStack{
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
                VStack{
                    HStack(alignment: .center){
                        Image("sharps")
                            .resizable()
                            .scaledToFit()
                        
                        VStack(alignment:.leading){
                            Text("or")
                                .font(.system(size: 40))
                            Text("sharps")
                                .font(.system(size:80))
                                .bold()
                        }
                    }
                }
                .frame(maxHeight:.infinity)
                
                HStack{
                    NavigationLink{
                        SheetMusicOrganisationLearn4View()
                    }label:{
                        Text("back")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width:100,height:50)
                                
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                    
                    Spacer()
                    
                    NavigationLink{
                        SheetMusicOrganisationLearn6View()
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
    SheetMusicOrganisationLearn5View()
}
