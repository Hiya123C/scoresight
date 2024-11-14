////
////  Sandbox2ViewModel.swift
////  scoresight1
////
////  Created by Crystal on 14/11/24.
//
//import SwiftUI
//
//class Sandbox2ViewModel: ObservableObject {
//    @Published var restImages: [String] = ["crochet rest", "crochet rest", "crochet rest", "crochet rest"]
//    @Published var notes: [Note] = []
//    
//
//    func resetRests() {
//        restImages = ["crochet rest", "crochet rest", "crochet rest", "crochet rest"]
//    }
//
//    
//    func replaceRest(with noteLength: String) {
//        switch noteLength {
//        case "minim":
//            restImages = ["minim rest","minim rest",] //all minim ?
//        case "quaver":
//            restImages = ["quaver rest", "quaver rest", "quaver rest","quaver rest","quaver rest","quaver rest","quaver rest","quaver rest"]
//        default:
//            restImages = ["crochet rest", "crochet rest","crochet rest","crochet rest"]
//        }
//    }
////        func addNote(type: String, at position: CGPoint) {
////            let newNote = Note(position: position, type: type, pitch: calculatePitch(for: position))
////            notes.append(newNote)
////        }
//    
//  //*
//    func updatePitch(for note: Note, at position: CGPoint) -> Note {
//        var updatedNote = note
//        updatedNote.position = position
//        updatedNote.pitch = calculatePitch(for: position)
//        return updatedNote
//    }
//    
//    private func calculatePitch(for position: CGPoint) -> Int {
//        return Int(position.y / 10)
//    }
//    //*
//}
//  
//    
//    
//   
