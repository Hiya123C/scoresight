//
//  DynamicsView.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI
import AVFoundation

struct DynamicsLearnView: View {
    
    @State private var volume = 0.0
    @State private var isEditing = false
    // figure out how to change the slider colour
    @State private var audioPlayer: AVAudioPlayer?
    
    func playAudio1() {
        guard let soundURL = Bundle.main.url(forResource: "ppp", withExtension: "mp3") else {
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
    
    func playAudio2() {
        guard let soundURL = Bundle.main.url(forResource: "pp", withExtension: "mp3") else {
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
    
    func playAudio3() {
        guard let soundURL = Bundle.main.url(forResource: "piano", withExtension: "mp3") else {
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
    
    func playAudio4() {
        guard let soundURL = Bundle.main.url(forResource: "mezzopiano", withExtension: "mp3") else {
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
    
    func playAudio5() {
        guard let soundURL = Bundle.main.url(forResource: "mezzoforte", withExtension: "mp3") else {
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
    
    func playAudio6() {
        guard let soundURL = Bundle.main.url(forResource: "forte", withExtension: "mp3") else {
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
    
    func playAudio7() {
        guard let soundURL = Bundle.main.url(forResource: "ff", withExtension: "mp3") else {
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
    
    func playAudio8() {
        guard let soundURL = Bundle.main.url(forResource: "fff", withExtension: "mp3") else {
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
                
                if volume <= 14.1 {
                    VStack {
                        Image("ppp")
                            .resizable()
                            .scaledToFit()
                        Text("pianississimo")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                    }
                    .onAppear {
                        playAudio1()
                    }
                    .onDisappear {
                        stopAudio1()
                    }
                }
                
                else if volume <= 28.3 {
                    VStack {
                        Image("pp")
                            .resizable()
                            .scaledToFit()
                        Text("pianissimo")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                    }
                    .onAppear {
                        playAudio2()
                    }
                    .onDisappear {
                        stopAudio2()
                    }
                }
                
                else if volume <= 42.5 {
                    VStack {
                        Image("piano")
                            .resizable()
                            .scaledToFit()
                        Text("piano")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                    }
                    .onAppear {
                        playAudio3()
                    }
                    .onDisappear {
                        stopAudio3()
                    }
                }
                
                else if volume <= 56.7 {
                    VStack {
                        Image("mezzopiano")
                            .resizable()
                            .scaledToFit()
                        Text("mezzopiano")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                    }
                    .onAppear {
                        playAudio4()
                    }
                    .onDisappear {
                        stopAudio4()
                    }
                }
                
                else if volume <= 70.9 {
                    VStack {
                        Image("mezzoforte")
                            .resizable()
                            .scaledToFit()
                        Text("mezzoforte")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                    }
                    .onAppear {
                        playAudio5()
                    }
                    .onDisappear {
                        stopAudio5()
                    }
                }
                
                else if volume <= 85.1 {
                    VStack {
                        Image("forte")
                            .resizable()
                            .scaledToFit()
                        Text("forte")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                    }
                    .onAppear {
                        playAudio6()
                    }
                    .onDisappear {
                        stopAudio6()
                    }
                }
                
                else if volume <= 99.3 {
                    VStack {
                        Image("ff")
                            .resizable()
                            .scaledToFit()
                        Text("fortissimo")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                    }
                    .onAppear {
                        playAudio7()
                    }
                    .onDisappear {
                        stopAudio7()
                    }
                }
                
                else {
                    VStack {
                        Image("fff")
                            .resizable()
                            .scaledToFit()
                        Text("fortississimo")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                    }
                    .onAppear {
                        playAudio8()
                    }
                    .onDisappear {
                        stopAudio8()
                    }
                }
                
                Slider(
                    value: $volume,
                    in: 0...100,
                    step: 14.2
                ) {
                    Text("volume")
                } minimumValueLabel: {
                    Text("soft")
                        .font(.system(size: 30))
                } maximumValueLabel: {
                    Text("loud")
                        .font(.system(size: 30))
                } onEditingChanged: { editing in
                    isEditing = editing
                }
                Text("Play around with the slider to see some common loud and soft dynamics!")
                HStack{
                    Spacer()
                    NavigationLink{
                        DynamicsLearn2View()
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
    private func stopAudio1() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    private func stopAudio2() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    private func stopAudio3() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    private func stopAudio4() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    private func stopAudio5() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    private func stopAudio6() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    private func stopAudio7() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    private func stopAudio8() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}

#Preview {
    DynamicsLearnView()
}
