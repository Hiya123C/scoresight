//drag and drop how to relative positioning?
//not needed

import SwiftUI

struct SheetMusicOrganisationReview2View: View {
    var body: some View {
        VStack {
            NavigationStack {
                HStack {
                    NavigationLink {
                        SheetMusicOrganisationView()
                    } label: {
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size: 50))
                    }
                    Spacer()
                }
                Spacer()
                
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Spacer()
                        DropArea()
                    }
                    Spacer()
                    
                    VStack{
                        Spacer()
                        DragArea()
                    }
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        SheetMusicOrganisationReview3View()
                    } label: {
                        Text("next")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    func DropArea() -> some View {
        
        ZStack {
            Image("single bar")
                .resizable()
                .scaledToFit()
            
            VStack{
                //                Image("tempo")
                //                    .resizable()
                //                    .scaledToFit()
                //                    .scaleEffect(0.6)
                //                    .position(x:140, y:-30)
                
                
                Spacer()
            }.frame(maxHeight: .infinity)
            
            VStack{
                HStack(alignment: .center){
                    HStack{
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 130, height: 150)
                        
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 80, height: 90)
                        
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 110, height: 150)
                        
                        
                    }
                    Spacer()
                    
                    //                    Image("single treble")
                    //                        .resizable()
                    //                        .scaledToFit()
                    //                        .scaleEffect(1.2)
                    //                        .position(x:140, y:60)
                    //
                    //                    Image("flat")
                    //                        .resizable()
                    //                        .scaledToFit()
                    //                        .scaleEffect(0.9)
                    //                        .position(x: -60,y:45)
                    //
                    //                    Image("44")
                    //                        .resizable()
                    //                        .scaledToFit()
                    //                        .scaleEffect(0.95)
                    //                        .position(x: -260,y:57)
                }
            }
            
        }
    }
    
    
    @ViewBuilder
    func DragArea() -> some View {
        HStack {
            Spacer()
            Image("44")
                .resizable()
                .scaledToFit()
                .draggable("44")
            Spacer()
            Image("single treble")
                .resizable()
                .scaledToFit()
                .draggable("single treble")
            Spacer()
            Image("tempo")
                .resizable()
                .scaledToFit()
                .draggable("tempo")
            Spacer()
            Image("flat")
                .resizable()
                .scaledToFit()
                .draggable("flat")
            Spacer()
        }
    }
    
}

#Preview {
    SheetMusicOrganisationReview2View()
}
