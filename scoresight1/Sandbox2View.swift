//
//  Sandbox2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct Sandbox2View: View {
    var body: some View {
        NavigationStack{

            VStack{

                HStack(alignment: .top ){

                    VStack{

                        Button(action:{print("try")})
                        {
                            Image(systemName: "x.circle")
                                .symbolRenderingMode(.palette)
                                    .foregroundStyle(.black, .white)
                                .font(.system(size:50))
                                .position(x:0,y:50)//find out how to replace position


                        }



                        Text("move the note up and down the bar lines to adjust pitch")
                            .padding()
                            .font(.system(size:25))
                            .position(x:360,y:-80)
                    }

                }

                Spacer()
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
