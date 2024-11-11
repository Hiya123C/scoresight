//add play button

import SwiftUI

struct SheetMusicOrganisationLearn8View: View {
    
    
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
                    Spacer()
                    HStack{
                        Image("end sign")
                            .resizable()
                            .scaledToFit()
                    }
                    //click play button to play audio**
                    
                    Spacer()
                    
                    HStack(alignment:.center){
                        Spacer()
                        Text("this is a")
                            .font(.system(size: 40))
                        Text("endsign")
                            .font(.system(size:60))
                            .bold()
                    }
                }
                .frame(maxHeight:.infinity)
                
                HStack{
                    
                    NavigationLink{
                        SheetMusicOrganisationLearn7View()
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
                        SheetMusicOrganisationLearn9View()
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
    SheetMusicOrganisationLearn8View()
}
