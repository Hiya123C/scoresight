//


import SwiftUI

struct SandboxView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    Button(action:{
                        dismiss()
                    }){
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }

                Spacer()
                ViewThatFits{
                    Text("sandbox")
                        .fontWeight(.bold)
                        .font(.system(size: 110))
                        .multilineTextAlignment(.center)
                    Text("sandbox")
                        .fontWeight(.bold)
                        .font(.system(size: 100))
                        .multilineTextAlignment(.center)
                }
                Spacer()
                
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
