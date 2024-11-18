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
    @State private var audioPlayer: AVAudioPlayer?
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented: Bool
    
    func playAudio1() {
        guard let soundURL = Bundle.main.url(forResource: "ppp", withExtension: "mp3") else {
            print("Audio fd.") //why audio file cant find
            return
        }
        do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.play()
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
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.play()
        
            
    
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

                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.play()
            
    
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
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.play()
            
    
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
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.play()
            
    
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
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.play()
    
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
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.play()
            
    
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
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.play()
            
    
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
        }
    }
    
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
                
                if volume <= 14.1 {
                    VStack {
                        Image("ppp")
                            .resizable()
                            .scaledToFit()
                        Text("pianississimo")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
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
                }
                Slider(
                    value: $volume,
                    in: 0...100,
                    step: 14.2
                ){
                    Text("volume")
                } minimumValueLabel: {
                    Text("soft")
                        .font(.system(size: 30))
                } maximumValueLabel: {
                    Text("loud")
                        .font(.system(size: 30))
                }
                onEditingChanged: { editing in
                    if editing == false {
                        print(volume)
                        if volume <= 14.1 {
                            playAudio1()
                        } else if volume <= 28.3 {
                            playAudio2()
                        }else if volume <= 42.5 {
                            playAudio3()
                        }else if volume <= 56.7 {
                            playAudio4()
                        }else if volume <= 70.9 {
                            playAudio5()
                        }else if volume <= 85.1 {
                            playAudio6()
                        }else if volume <= 99.3 {
                            playAudio7()
                        }
                        else {
                            playAudio8()
                        }
                    }
                }.tint(.black)
                Text("Play around with the slider to see some common loud and soft dynamics! Let go of the slider to hear how it sounds.")
                HStack{
                    Spacer()
                    NavigationLink{
                        DynamicsLearn2View(isPresented:$isPresented)
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
    @Previewable @State var isShowing = false
  DynamicsLearnView(isPresented: $isShowing)
}
