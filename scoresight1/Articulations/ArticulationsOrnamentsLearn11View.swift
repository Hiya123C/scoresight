//
//  ArticulationsOrnamentsLearn11View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct ArticulationsOrnamentsLearn11View: View {
    
    @State private var audioPlayer: AVAudioPlayer?

    func playPiano() {
        guard let soundURL = Bundle.main.url(forResource: "upper mordent", withExtension: "mp3") else {
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
                        ArticulationsOrnamentsView()
                    }label:{
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size:50))
                    }
                    Spacer()
                }
                
                HStack {
                    Image("upper mordent")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .trailing) {
                        Text("this is an")
                            .font(.system(size: 40))
                        Text("upper/nmordent")
                            .font(.system(size:80))
                            .bold()
                    }
                }
                HStack{
                    NavigationLink{
                        ArticulationsOrnamentsLearn10View()
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
                        
                    }
                    Spacer()
                    Button(action: {
                        replayAudio()
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                    }
                    .padding()
                    NavigationLink{
                        ArticulationsOrnamentsLearn12View()
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
                .padding(.horizontal)
            }
            .onAppear {
                speakText("this is an upper mordent. It is played by rapidly alternating between the main note and the note immediately above it like so:")
                playPiano()
            }
            .onDisappear {
                stopAudio()
            }
            .navigationBarHidden(true)
        }
    }
    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        synthesizer.speak(utterance)
    }
    
    private func replayAudio() {
        speakText("this is an upper mordent. It is played by rapidly alternating between the main note and the note immediately above it like so:")
        playPiano()
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
        audioPlayer?.stop()
        audioPlayer = nil
    }
}


#Preview {
    ArticulationsOrnamentsLearn11View()
}
