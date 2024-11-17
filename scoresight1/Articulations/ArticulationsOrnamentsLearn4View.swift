//
//  ArticulationsOrnamentsLearn4.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct ArticulationsOrnamentsLearn4View: View {
    
    @State private var audioPlayer: AVAudioPlayer?

    func playPiano() {
        guard let soundURL = Bundle.main.url(forResource: "turn", withExtension: "mp3") else {
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
                Spacer()
                HStack {
                    Image("turn")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .trailing) {
                        Text("this is a")
                            .font(.system(size: 40))
                        Text("turn")
                            .font(.system(size:80))
                            .bold()
                    }
                }
                Spacer()
                HStack{
                    NavigationLink{
                        ArticulationsOrnamentsLearn3View()
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
                        ArticulationsOrnamentsLearn5View()
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
                speakText("this is a turn and an inverted turn respectively, and how the notes look like written out. they usually have four notes and end at the ‘core’ note which is the note that is displayed, like so:")
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
        speakText("this is a turn and an inverted turn respectively, and how the notes look like written out. they usually have four notes and end at the ‘core’ note which is the note that is displayed, like so:")
        playPiano()
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
        audioPlayer?.stop()
        audioPlayer = nil
    }
}

#Preview {
    ArticulationsOrnamentsLearn4View()
}
