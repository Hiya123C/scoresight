//
//  RhythmNotesRestsLearn4View.swift
//  scoresight1
//
//  Created by T Krobot on 11/11/24.
//

import SwiftUI
import AVFoundation

struct RhythmNotesRestsLearn4View: View {
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isFirstButtonHeld = false
    @State private var isSecondButtonHeld = false
    @State private var firstButtonProgress: CGFloat = 0
    @State private var secondButtonProgress: CGFloat = 0
    @State private var showAlert = false
    @State private var firstTimer: Timer?
    @State private var secondTimer: Timer?
    @State private var metronomeIsPlaying = false
    private let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {}) {
                        NavigationLink(destination: RhythmNotesRestsView()) {
                            Image(systemName: "x.circle")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .white)
                                .font(.system(size: 40))
                        }
                    }
                    Spacer()
                }
                .padding([.leading, .top], 10)
                
                Spacer()
                
                // Main Content with Hold and Tap Buttons
                HStack(spacing: 20) {
                    // First Hold Button (Crochet Note)
                    VStack {
                        Image("crochet") // Replace with your note image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 120)
                        
                        Button(action: {
                            startHoldButton(isFirstButton: true)
                        }) {
                            ZStack {
                                Rectangle()
                                    .fill(Color.blue.opacity(firstButtonProgress))
                                    .cornerRadius(10)
                                
                                Text("TAP!")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 90, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                        }
                        .simultaneousGesture(LongPressGesture(minimumDuration: 0.1).onChanged { _ in
                            startHoldButton(isFirstButton: true)
                        }.onEnded { _ in
                            stopFirstButtonHold()
                        })
                    }
                    
                    // Second Hold Button (Crochet Note)
                    VStack {
                        Image("crochet") // Replace with your note image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 120)
                        
                        Button(action: {
                            startHoldButton(isFirstButton: false)
                        }) {
                            ZStack {
                                Rectangle()
                                    .fill(Color.blue.opacity(secondButtonProgress))
                                    .cornerRadius(10)
                                
                                Text("TAP!")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 90, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                        }
                        .simultaneousGesture(LongPressGesture(minimumDuration: 0.1).onChanged { _ in
                            startHoldButton(isFirstButton: false)
                        }.onEnded { _ in
                            stopSecondButtonHold()
                        })
                    }
                    
                    // Tap Buttons for Crochet Rests
                    VStack {
                        Image("crochet rest") // Add rest image for the crochet rest
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 120)
                        
                        Button(action: {
                            showAlert = true
                        }) {
                            Text("TAP!")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(width: 90, height: 50)
                                .background(Color.red)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Warning"), message: Text("Do not play during a rest"), dismissButton: .default(Text("OK")))
                        }
                    }
                    
                    VStack {
                        Image("crochet rest")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 120)
                        
                        Button(action: {
                            showAlert = true
                        }) {
                            Text("TAP!")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(width: 90, height: 50)
                                .background(Color.red)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
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
                    Button(action: {}) {
                        NavigationLink(destination: RhythmNotesRestsLearn3View()) {
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
                    }
                    Spacer()
                    Button(action: {
                        replayAudio()
                    }) {
                        HStack (spacing: 20) {
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(.black)
                                .padding(.leading, 10)
                            NavigationLink(destination: RhythmNotesRestsLearn5View()) {
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
                        }
                    }
                }
                .padding([.leading, .trailing, .bottom], 20)
            }
            .navigationBarHidden(true)
            .onAppear(){
                speakText("These are two crochets, followed by two crochet rests. Similarly to the semibreve note, it is four beats long. However, instead of holding the note, you don't play for 4 beats.")
            }
            .onDisappear() {
                synthesizer.stopSpeaking(at: .immediate)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onDisappear {
            stopTimers()
            stopMetronome()
        }
    }

    private func replayAudio() {
        speakText("These are two crochets, followed by two crochet rests. Similarly to the semibreve note, it is four beats long. However, instead of holding the note, you don't play for 4 beats.")
    }

    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        synthesizer.speak(utterance)
    }

    private func startHoldButton(isFirstButton: Bool) {
        stopMetronome()

        if isFirstButton {
            isFirstButtonHeld = true
            firstButtonProgress = 0.0
            playMetronome(forBeats: 4)
            animateButtonProgress(isFirstButton: true)
        } else {
            isSecondButtonHeld = true
            secondButtonProgress = 0.0
            playMetronome(forBeats: 1)
            animateButtonProgress(isFirstButton: false)

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                playMetronome(forBeats: 2)
            }
        }
    }

    private func stopFirstButtonHold() {
        isFirstButtonHeld = false
        stopMetronome()
    }

    private func stopSecondButtonHold() {
        isSecondButtonHeld = false
        stopMetronome()
    }

    private func animateButtonProgress(isFirstButton: Bool) {
        let duration: TimeInterval = 1.0

        if isFirstButton {
            firstTimer?.invalidate()
            firstTimer = Timer.scheduledTimer(withTimeInterval: duration / 100, repeats: true) { timer in
                if firstButtonProgress < 1 {
                    firstButtonProgress += 0.01
                } else {
                    timer.invalidate()
                }
            }
        } else {
            secondTimer?.invalidate()
            secondTimer = Timer.scheduledTimer(withTimeInterval: duration / 100, repeats: true) { timer in
                if secondButtonProgress < 1 {
                    secondButtonProgress += 0.01
                } else {
                    timer.invalidate()
                }
            }
        }
    }

    private func playMetronome(forBeats beats: Int) {
        guard let url = Bundle.main.url(forResource: "metronome1", withExtension: "m4a") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = beats - 1
            audioPlayer?.play()
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
        }
    }

    private func stopMetronome() {
        audioPlayer?.stop()
    }

    private func stopTimers() {
        firstTimer?.invalidate()
        secondTimer?.invalidate()
    }
}

#Preview {
    RhythmNotesRestsLearn4View()
}
