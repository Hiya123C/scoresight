//
//  ClefsPitchedNotesReviewFile.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import Foundation

struct Quiz: Decodable, Hashable {
    var title: String
    var questions: [Question]
}
struct Question: Decodable, Hashable {
    var question: String
    var options: [String]
    var answer: String
}
extension Quiz { static var empty: Self = .init(title: "", questions: []) }
