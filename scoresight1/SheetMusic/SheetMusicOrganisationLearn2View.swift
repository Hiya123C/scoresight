//

import SwiftUI

struct SheetMusicOrganisationLearn2View: View {
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
                        Image("clefs")
                            .resizable()
                            .scaledToFit()
                        
                        //position?
                        VStack{
                            Text("these are")
                                .font(.system(size: 40))
                            Text("clefs")
                                .font(.system(size:80))
                                .bold()
                            
                        }
                    }
                }
                .frame(maxHeight:.infinity)
                
                HStack{
                    
                    NavigationLink{
                        SheetMusicOrganisationLearnView()
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
                        SheetMusicOrganisationLearn3View()
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
    SheetMusicOrganisationLearn2View()
}
