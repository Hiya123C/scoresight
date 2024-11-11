//add play button

import SwiftUI

struct SheetMusicOrganisationLearn10View: View {
    
    
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
                Spacer()
                ZStack{
                    HStack{
                        Image("tempo marking")
                            .resizable()
                            .scaledToFit()
                    }
                    VStack{
                        HStack(alignment:.center){
                            Text("this is a")
                                .font(.system(size: 30))
                            Text("tempo marking")
                                .font(.system(size:40))
                                .bold()
                            Spacer()
                        }
                        Spacer()
                    }
                    //click play button to play audio**
                    
                }
                
                
                HStack{
                    NavigationLink{
                        SheetMusicOrganisationLearn9View()
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
                    
//                    NavigationLink{
//                        SheetMusicOrganisationLearn11View()
//                    }label:{
//                        Text("next")
//                            .padding()
//                            .background(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.black, lineWidth: 3)
//                                    .frame(width:100,height:50)
//                                
//                            )
//                            .foregroundStyle(.black)
//                            .font(.system(size: 25))
//                    } NO NEXT!!!
                }
            }
            
        }
        .frame(maxWidth:.infinity, maxHeight:.infinity)
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    SheetMusicOrganisationLearn10View()
}
