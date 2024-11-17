//
//  KeySignaturesAccidentalsReviewView.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct KeySignaturesAccidentalsReviewView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    NavigationLink{
                        KeySignaturesAccidentalsView()
                    } label:{
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                Spacer()
                Text("test your\nknowledge!")
                    .fontWeight(.bold)
                    .font(.system(size:100)).environment(\._lineHeightMultiple, 0.75)
                    .multilineTextAlignment(.center)
                Spacer()
                HStack{
                    NavigationLink{
                        KeySignaturesAccidentalsLearn16View()
                    } label:{
                        Text("back")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width:100,height:50)
                                
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                        Spacer()
                        
                    }
                    NavigationLink{
                        KeySignaturesAccidentalsReview2View()
                    } label:{
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
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    KeySignaturesAccidentalsReviewView()
}
