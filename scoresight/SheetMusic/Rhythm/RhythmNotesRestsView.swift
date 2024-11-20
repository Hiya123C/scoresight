//
//  RhythmNotesRestsView.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct RhythmNotesRestsView: View {
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    NavigationLink{
                        ContentView()
                    } label:{
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                Spacer()
                ViewThatFits{
                                Text("rhythm notes\n+ rests")
                                    .fontWeight(.bold)
                                    .font(.system(size:95)).environment(\._lineHeightMultiple, 0.75)
                                Text("rhythm notes\n+ rests")
                                    .fontWeight(.bold)
                                    .font(.system(size:75)).environment(\._lineHeightMultiple, 0.75)
                                Text("rhythm notes\n+ rests")
                                    .fontWeight(.bold)
                                    .font(.system(size:70)).environment(\._lineHeightMultiple, 0.75)
                                Text("rhythm notes\n+ rests")
                                    .fontWeight(.bold)
                                    .font(.system(size:60)).environment(\._lineHeightMultiple, 0.75)
                            }
                Spacer()
                
                NavigationLink{
                    RhythmNotesRestsLearnView()
                }label:{
                    Text("learn")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 3)
                                .frame(width: 200, height: 50)
                        )
                }
                
                Spacer()
                
                NavigationLink{
                    RhythmNotesRestsReviewView()
                }label:{
                    Text("review")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                        .bold()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 3)
                                .frame(width: 200, height: 50)
                        )
                }
                
            
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    RhythmNotesRestsView()
}
