//
//  RhythmNotesRestsLearn3View.swift
//  scoresight1
//
//  Created by T Krobot on 11/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct RhythmNotesRestsLearn3View: View {
    @State private var showAlert = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isHolding = false
    @State private var buttonFillAmount: CGFloat = 0.0
    @State private var beatCount = 0
    @State private var timer: Timer?
    @State private var metronomeIsPlaying = false
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented: Bool
    
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
                .padding(.leading, 10)
                .padding(.top, 10)
                
                Spacer()
                
                HStack(spacing: 20) {
                    VStack {
                        Image("minim")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 150)
                        
                        Button(action: {}) {
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(width: 150 * buttonFillAmount, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                
                                Text("HOLD!")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .frame(width: 150, height: 60)
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.black, lineWidth: 2)
                                    )
                            }
                        }
                        .simultaneousGesture(LongPressGesture(minimumDuration: 0.1)
                            .onEnded { _ in
                                isHolding = false
                                startMetronomeForFourBeats()
                            }
                            .onChanged { pressing in
                                if pressing {
                                    isHolding = true
                                    if !metronomeIsPlaying {
                                        startMetronomeForFourBeats()
                                    }
                                }
                            })
                    }
                    
                    VStack {
                        Image("minim rest")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 150)
                        
                        Button(action: {
                            showAlert = true
                        }) {
                            ZStack {
                                Rectangle()
                                    .fill(Color.red)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                
                                Text("TAP!")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 150, height: 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Warning"), message: Text("Do not play during a rest"), dismissButton: .default(Text("OK")))
                        }
                    }
                }
                
                Spacer()
                
                HStack {
                    Button(action:{
                        dismiss()
                    }){
                        Text("back")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                    Button(action: {
                        replayAudio()
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .padding(.trailing, 10)
                    }
                    NavigationLink(destination: RhythmNotesRestsLearn4View(isPresented:$isPresented)) {
                        Text("next")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                    .padding(.trailing, 20)
                }
                .padding(.bottom, 20)
                .onAppear {
                    speakText("This is a minim, followed by a minim rest. You have to play the minim for two beats. Hold the rectangular button for two beats. Do not play during the minim rest. Listen to the metronome to know the duration of the four beats.")
                }
            }
            .navigationBarBackButtonHidden(true)
            .onDisappear {
                stopAudio()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func startMetronomeForFourBeats() {
        buttonFillAmount = 0.0
        beatCount = 0
        metronomeIsPlaying = true
        
        // Start metronome once
        playMetronome()
        
        // Cancel any existing timer
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            beatCount += 1
            
            if beatCount <= 2 {
                buttonFillAmount += 0.5
            }
            
            if beatCount == 4 {
                stopMetronome()
                timer?.invalidate()
            }
        }
    }
    
    
    private func playMetronome() {
        guard let url = Bundle.main.url(forResource: "metronome1", withExtension: "m4a") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = 4
            audioPlayer?.play()
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
        }
    }
    
    private func stopMetronome() {
        audioPlayer?.stop()
        metronomeIsPlaying = false
    }
    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        synthesizer.speak(utterance)
    }
    
    private func replayAudio() {
        speakText("This is a minim, followed by a minim rest. You have to play the minim for two beats. Hold the rectangular button for two beats. Do not play during the minim rest. Listen to the metronome to know the duration of the four beats.")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
    
}

#Preview {
    @Previewable @State var isShowing = false
    RhythmNotesRestsLearn3View(isPresented: $isShowing)
}
