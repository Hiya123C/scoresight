//
//  RhythmNotesRestsReview2View.swift
//  scoresight1
//
//  Created by T Krobot on 13/11/24.
//

import SwiftUI
//sheet dont need a close button for sheet, just immediately go back to home screen

struct RhythmNotesRestsReview2View: View {
    
    var fourColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    @State var showCompletionSheet = false
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented: Bool //waht private
    
    var body: some View {
        GeometryReader { geo in
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
                    .padding([.top, .leading], 10)
                    
                    ScrollView {
                        LazyVGrid(columns: fourColumnGrid, spacing: 10) {
                            ForEach(cards) { card in
                                CardView(card: card,
                                         width: calculateCardWidth(totalWidth: geo.size.width),
                                         MatchedCards: $MatchedCards,
                                         UserChoices: $UserChoices,
                                         onMatch: checkForCompletion)
                            }
                        }
                        .padding()
                        
                    }
                }
                .navigationBarHidden(true)
                .sheet(isPresented: $showCompletionSheet) {
                    CompletionSheet()
                }
                .navigationBarHidden(true)
            }
            .navigationBarHidden(true)
        }
    }
    
    func calculateCardWidth(totalWidth: CGFloat) -> CGFloat {
        let spacing: CGFloat = 10
        let columns: CGFloat = 4
        let totalSpacing = (columns - 1) * spacing + 20
        let availableWidth = totalWidth - totalSpacing
        return availableWidth / columns * 0.8
    }
    
    func checkForCompletion() {
        if MatchedCards.count == cards.count {
            showCompletionSheet = true
        }
    }
}

struct CompletionSheet: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Well done!")
                .font(.largeTitle)
                .padding(.bottom, 20)
            Text("Click on the x button to exit.")
                .font(.headline)
                .padding(.bottom, 40)
            
            Button("Close") {
                dismiss()
            }
            .font(.title2)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var isShowing = false
    RhythmNotesRestsReview2View(isPresented: $isShowing)
}
