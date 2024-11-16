//
//  ClefsPitchedNotesLearn11View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI
import AVFoundation

struct ClefsPitchedNotesLearn11View: View {
    
    @State private var audioPlayer: AVAudioPlayer?
    
    func playAudio() {
        guard let soundURL = Bundle.main.url(forResource: "basspitched", withExtension: "mp3") else {
            print("Audio fd.") //why audio file cant find
            return
        }
        do {
            if audioPlayer == nil {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = 0
            }
            
    
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    NavigationLink{
                        ClefsPitchedNotesView()
                    }label:{
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                Text("pitched notes on the bass clef")
                    .font(.system(size: 40))
                Image("bass clef pitched notes")
                    .resizable()
                    .scaledToFit()
                HStack{
                    NavigationLink{
                        ClefsPitchedNotesLearn10View()
                    }label:{
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
                    Button(action: {
                        playAudio()
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                    }
                    .padding()
                    NavigationLink{
                        ClefsPitchedNotesLearn12View()
                    }label:{
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
                .onDisappear {
                    stopAudio()
                }
                .navigationBarBackButtonHidden(true)
            }
        }
        private func stopAudio() {
            audioPlayer?.stop()
            audioPlayer = nil
    }
}

#Preview {
    ClefsPitchedNotesLearn11View()
}
