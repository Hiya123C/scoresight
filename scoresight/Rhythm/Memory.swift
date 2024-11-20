//
//  RhythmNotesRestsReview2View.swift
//  scoresight1
//
//  Created by T Krobot on 12/11/24.
//

import SwiftUI
import Foundation

class Card: Identifiable, ObservableObject {
    var id = UUID()
    @Published var isFaceUp = false
    @Published var isMatched = false
    var imageName: String
    var matchingPair: String // The name of the card's matching pair
    
    init(imageName: String, matchingPair: String) {
        self.imageName = imageName
        self.matchingPair = matchingPair
    }
    
    func turnOver() {
        self.isFaceUp.toggle()
    }
}

func createCardList() -> [Card] {
    return [
        Card(imageName: "two minims", matchingPair: "semibreve"),
        Card(imageName: "semibreve", matchingPair: "two minims"),
        Card(imageName: "two crochets", matchingPair: "minim"),
        Card(imageName: "minim", matchingPair: "two crochets"),
        Card(imageName: "two quavers", matchingPair: "crochet"),
        Card(imageName: "crochet", matchingPair: "two quavers"),
        Card(imageName: "two semiquavers", matchingPair: "quaver"),
        Card(imageName: "quaver", matchingPair: "two semiquavers"),
        Card(imageName: "two demisemiquavers", matchingPair: "semiquaver"),
        Card(imageName: "semiquaver", matchingPair: "two demisemiquavers")
    ]
}
