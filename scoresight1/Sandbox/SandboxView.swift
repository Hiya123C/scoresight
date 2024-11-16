//


import SwiftUI

struct SandboxView: View {
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    NavigationLink{
                        ContentView()
                    }label:{
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                Text("sandbox")
                    .fontWeight(.bold)
                    .font(.system(size: 100))
                    .multilineTextAlignment(.center)
                
                NavigationLink{
                    Sandbox1View()
                }label:{
                    Text("start")
                        .bold()
                        .padding()
                        .buttonStyle(.borderedProminent)
                        .background(
                            RoundedRectangle(cornerRadius:15)
                                .stroke(.black,lineWidth:3)
                                .frame(width:200, height:50)
                        )
                        .foregroundStyle(.black)
                        .font(.system(size: 30))
                }
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}



#Preview {
    SandboxView()
}
