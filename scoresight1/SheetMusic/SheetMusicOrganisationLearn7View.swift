//

import SwiftUI

struct SheetMusicOrganisationLearn7View: View {
    
    
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
                        Image("notes")
                            .resizable()
                            .scaledToFit()
                        
                        VStack(alignment:.leading){
                            Text("these are")
                                .font(.system(size: 40))
                            Text("notes")
                                .font(.system(size:60))
                                .bold()
                        }
                    }
                }
                .frame(maxHeight:.infinity)

                HStack{
                    NavigationLink{
                        SheetMusicOrganisationLearn6View()
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
                        SheetMusicOrganisationLearn8View()
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
    SheetMusicOrganisationLearn7View()
}
