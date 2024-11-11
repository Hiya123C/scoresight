//add play button

import SwiftUI

struct SheetMusicOrganisationLearn9View: View {
    
    
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
                    Image("repeat sign")
                        .resizable()
                        .scaledToFit()
                    
                    //click play button to play audio**
                    
                    HStack(alignment:.center){
                        Text("this is a")
                            .font(.system(size: 45))
                        Text("repeat sign")
                            .font(.system(size:60))
                            .bold()
                        Spacer()
                    }
                }
                .frame(maxHeight:.infinity)
                
                HStack{
                    NavigationLink{
                        SheetMusicOrganisationLearn8View()
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
                        SheetMusicOrganisationLearn10View()
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
    SheetMusicOrganisationLearn9View()
}
