//possible to move to next view without transition animation?

import SwiftUI

struct SheetMusicOrganisationLearnView: View {
    
    @State private var isFullScreenPresented = false
    @State private var isFullScreenPresented2 = false
    
    var body: some View {
        VStack{
            Button(action:{
                print("haha")//same issue
                isFullScreenPresented = true
            }){
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
                
                 //position?
                VStack{
                    Text("this is a ")
                        .font(.system(size: 40))
                    Text("bar")
                        .font(.system(size:80))
                        .bold()

                }
            }
            
            
            HStack{
                Spacer()
                Button(action: {
                    isFullScreenPresented2 = true
                })
                {
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
        .fullScreenCover(isPresented: $isFullScreenPresented) {
            SheetMusicOrganisationView()
        }
        .fullScreenCover(isPresented: $isFullScreenPresented2) {
            SheetMusicOrganisationLearn2View()
        }
        
    }
}

#Preview {
    SheetMusicOrganisationLearnView()
}
