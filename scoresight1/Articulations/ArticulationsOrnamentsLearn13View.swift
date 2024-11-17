//
//  ArticulationsOrnamentsLearn13View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct ArticulationsOrnamentsLearn13View: View {
    
    @State private var audioPlayer: AVAudioPlayer?

    func playPiano() {
        guard let soundURL = Bundle.main.url(forResource: "apoggiatura", withExtension: "mp3") else {
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
                    Image("apoggiatura")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .trailing) {
                        Text("this is an")
                            .font(.system(size: 40))
                        Text("apoggiatura")
                            .font(.system(size:65))
                            .bold()
                    }
                }
                Spacer()
                HStack{
                    NavigationLink{
                        ArticulationsOrnamentsLearn12View()
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
                        ArticulationsOrnamentsLearn14View()
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
                speakText("this is an apoggiatura. It is an ornamental note that leans into the main note, often taking part of its time. The tiny note is half the value of the big note. it is drawn without a slash. it is played like so:")
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
        speakText("this is an apoggiatura. It is an ornamental note that leans into the main note, often taking part of its time. The tiny note is half the value of the big note. it is drawn without a slash. it is played like so:")
        playPiano()
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
        audioPlayer?.stop()
        audioPlayer = nil
    }
}


#Preview {
    ArticulationsOrnamentsLearn13View()
}
