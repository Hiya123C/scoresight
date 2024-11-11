//possible to move to next view without transition animation?

import SwiftUI

<<<<<<< HEAD
struct SheetMusicOrganisationLearnView: View {    
    var body: some View {
        VStack{
            NavigationStack{
                NavigationLink{
                    SheetMusicOrganisationView()
                } label:{
                    Image(systemName: "x.circle")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .font(.system(size:50))
                        .position(x:0,y:50)//find out how to replace position
                }
                HStack(alignment: .center){ //the photo no movee.
                    Image("bar")
                        .resizable()
                        .frame(width: 500, height: 250, alignment: .bottom)
                        .position(x:300,y:70)
                    
                    VStack{
                        Text("this is a")
                            .font(.system(size: 40))
                        Text("bar")
                            .font(.system(size:80))
                            .bold()
                        
                    }
                }
                
                HStack{
                    Spacer()
                    
=======
struct SheetMusicOrganisationLearn1View: View {
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
>>>>>>> da0e430 (did. quite some stuff)
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
<<<<<<< HEAD
    SheetMusicOrganisationLearnView()
=======
    SheetMusicOrganisationLearn1View()
>>>>>>> da0e430 (did. quite some stuff)
}
