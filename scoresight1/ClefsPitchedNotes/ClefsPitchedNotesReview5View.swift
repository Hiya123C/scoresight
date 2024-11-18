//

import SwiftUI

struct ClefsPitchedNotesReview5View: View {
    @Binding var isPresented: Bool
    var body: some View {
        VStack{
            NavigationStack{
                Spacer()
                Text("Great job!")
                    .font(.system(size: 100))
                    .bold()
                Spacer()
                
                Button(action:{
                    isPresented = false
                }){
                    Text("exit")
                        .padding()
                        .font(.system(size: 30))
                        .bold()
                        .frame(width: 110, height: 60)
                        .foregroundStyle(.black)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.red)
                           
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 5)
                        )
                }
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @Previewable @State var isShowing = false
   ClefsPitchedNotesReview5View(isPresented: $isShowing)
}
