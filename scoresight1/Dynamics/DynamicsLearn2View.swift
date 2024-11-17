//
//  DynamicsLearn2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI
import AVFoundation

struct DynamicsLearn2View: View {
    
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlayingAudio = false

    func playAudio() {
        guard let soundURL = Bundle.main.url(forResource: "crescendo", withExtension: "mp3") else {
            print("Audio cannot find.")
            return
        }
        do {
            if audioPlayer == nil {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = 0
            }
            
            if let player = audioPlayer {
                if isPlayingAudio {
                    player.pause()
                } else {
                    player.play()
                }
                isPlayingAudio.toggle()
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
                        DynamicsView()
                    } label:{
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                Spacer()
                    VStack{
                        HStack{
                            Image("crescendo")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(1.2)
                            
                            
                            Button(action: {
                                playAudio()
                            }) {
                                Image(systemName: isPlayingAudio ? "pause.circle" : "play.circle")
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.black, .black)
                                    .font(.system(size: 50))
                                    .padding(30)
                            }
                        }
                        Text("gradually getting louder")
                            .font(.system(size: 25))
                        Text("crescendo")
                            .font(.system(size:80))
                            .bold()
                }
                Spacer()
                HStack{
                    NavigationLink{
                        DynamicsLearnView()
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
                        DynamicsLearn3View()
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
            .onDisappear {
                stopAudio()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    private func stopAudio() {
        audioPlayer?.stop()
        audioPlayer = nil
        isPlayingAudio = false
    }
}

#Preview {
    DynamicsLearn2View()
}
