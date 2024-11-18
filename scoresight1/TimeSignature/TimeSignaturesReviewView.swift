//
//  TimeSignaturesReviewView.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI

struct TimeSignaturesReviewView: View {
    @Binding var isPresented: Bool
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button(action:{
                        isPresented = false
                    }){
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                .padding([.leading, .top], 10)
                Spacer()
                Text("test your\nknowledge!")
                    .fontWeight(.bold)
                    .font(.system(size: 100))
                    .environment(\._lineHeightMultiple, 0.75)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack {
                    Button(action:{
                        dismiss()
                    }){
                        Text("back")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                    }) {                    NavigationLink(destination: TimeSignaturesReview2View(isPresented:$isPresented)){
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
                .padding([.leading, .trailing, .bottom], 20)
            }
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    @Previewable @State var isShowing = false
   TimeSignaturesReviewView(isPresented: $isShowing)
}
