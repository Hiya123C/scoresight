//possible to move to next view without transition animation?

import SwiftUI


struct SheetMusicOrganisationLearnView: View {
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
                    Spacer()//no work
                    HStack(alignment: .center){
                        Image("bar")
                            .resizable()
                            .scaledToFit()
                        VStack{
                            Text("this is a")
                                .font(.system(size: 40))
                            Text("bar")
                                .font(.system(size:80))
                                .bold()
                        }
                    }
                }
                .frame(maxHeight:.infinity)
                
                
                HStack{
                    Spacer()
                    NavigationLink{
                        SheetMusicOrganisationLearn2View()
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
    SheetMusicOrganisationLearnView()
}
