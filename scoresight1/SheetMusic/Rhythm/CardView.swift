//
//  CardView.swift
//  scoresight1
//
//  Created by T Krobot on 13/11/24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var card: Card
    let width: CGFloat
    
    @Binding var MatchedCards: [Card]
    @Binding var UserChoices: [Card]
    let onMatch: () -> Void // Closure to notify parent of a match
    
    var body: some View {
        if card.isFaceUp || MatchedCards.contains(where: { $0.id == card.id }) {
            Image(card.imageName)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: width, height: width)
                .background(Color(red: 0.68, green: 0.83, blue: 0.96))
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.18, green: 0.32, blue: 0.46), lineWidth: 5)
                }
        } else {
            Image("cardBack")
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: width, height: width)
                .background(Color(red: 0.68, green: 0.83, blue: 0.96))
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.18, green: 0.32, blue: 0.46), lineWidth: 5)
                }
                .onTapGesture {
                    if UserChoices.count < 2 {
                        card.turnOver()
                        UserChoices.append(card)
                        
                        if UserChoices.count == 2 {
                            withAnimation(Animation.linear.delay(1)) {
                                for thisCard in UserChoices {
                                    thisCard.turnOver()
                                }
                            }
                            checkForMatch()
                        }
                    }
                }
        }
    }
    
    func checkForMatch() {
        let firstCard = UserChoices[0]
        let secondCard = UserChoices[1]
        
        if firstCard.matchingPair == secondCard.imageName && secondCard.matchingPair == firstCard.imageName {
            MatchedCards.append(firstCard)
            MatchedCards.append(secondCard)
            onMatch() // Call onMatch when a pair is successfully matched
        }
        UserChoices.removeAll()
    }
}
