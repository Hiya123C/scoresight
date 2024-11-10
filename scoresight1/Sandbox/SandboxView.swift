//add cross


import SwiftUI

struct SandboxView: View {
    
    @State private var isFullScreenPresented = false
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            Button(action:{print("try")
                isPresented = true
            }){
                Image(systemName: "x.circle")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.black, .white)
                    .font(.system(size:50))
                    .position(x:0,y:50)//find out how to replace position
            }
            Text("sandbox")
                .fontWeight(.bold)
                .font(.system(size: 100))
                .multilineTextAlignment(.center)
            
            Button(action: {
                isFullScreenPresented = true
            }) {
                Text("start")
                    .bold()
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .overlay(
                        RoundedRectangle(cornerRadius:15)
                            .stroke(.black,lineWidth:3)
                            .frame(width:200, height:50)
                    )
                    .foregroundStyle(.black)
                    .font(.system(size: 30))
            }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
        .fullScreenCover(isPresented: $isPresented) {
            ContentView()
        }
        .fullScreenCover (isPresented: $isFullScreenPresented) {
            Sandbox2View()
                
            
        }
    }
}



#Preview {
    SandboxView()
}
