


import SwiftUI

struct Sandbox2View: View {
    
    @State private var isFullScreenPresented = false
    
    var body: some View {
        VStack{
            HStack(alignment: .top ){
                VStack{
                    
                    Button(action:{ //button not working
                        print("im working")
                        isFullScreenPresented = true
                    }){
                        Image(systemName: "x.circle")
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                            .position(x:0,y:50)//find out how to replace position
                    }
                   
                    Text("move the note up and down the bar lines to adjust pitch")
                        .padding()
                        .font(.system(size:25))
                }
                .fullScreenCover(isPresented: $isFullScreenPresented) {
                    SandboxView()
                        }
            }
            
            HStack{ //main content
                Image("sandbox original")
                    .resizable()
                    .frame(width: 650, height: 190, alignment: .center)
                    .padding()
                
                
                Button(action:{
                    print("play line")
                    //play
                }){
                    Image(systemName: "play.square")
                        .foregroundStyle(.black, .black)
                        .font(.system(size:70))
                } //looks abit ugly...
                
                
            }
            
            HStack{
                Spacer()
                Button(action: {})
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
        
    }
}




#Preview {
    Sandbox2View()
}
