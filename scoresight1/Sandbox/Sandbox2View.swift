//link cross to sandbox view
//


import SwiftUI

struct Sandbox2View: View {
    
    @State private var isFullScreenPresented = false
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top ){
                    VStack{
                        Button(action:{
                            isFullScreenPresented = true
                        }){
                            Image(systemName: "x.circle")
                                .symbolRenderingMode(.palette)
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
                HStack{
                    //main content
                    Image("sandbox original")
                        .resizable()
                        .frame(width: 650, height: 190, alignment: .center)
                        .padding()
                    
                    
                    Button(action:{
                        print("play line")
                        //play line
                    }){
                        Image(systemName: "play.square")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .black)
                            .font(.system(size:70))
                    } //
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
}




#Preview {
    Sandbox2View()
}
