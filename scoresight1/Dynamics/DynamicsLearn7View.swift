//
//  DynamicsLearn7.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI
import AVFoundation

struct DynamicsLearn7View: View {
    
    @State private var audioPlayer: AVAudioPlayer?
    
    func playAudio() {
        guard let soundURL = Bundle.main.url(forResource: "pf", withExtension: "mp3") else {
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
                        DynamicsView()
                    } label:{
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                Image("pianoforte")
                    .resizable()
                    .scaledToFit()
                Text("softly then immediately loudly")
                    .font(.system(size: 25))
                Text("pianoforte")
                    .font(.system(size:80))
                    .bold()
                HStack{
                    NavigationLink{
                        DynamicsLearn6View()
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
                    Button(action: {
                        playAudio()
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                    }
                    .padding()
                    NavigationLink{
                        DynamicsLearn8View()
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
    }
}

#Preview {
    DynamicsLearn7View()
}
