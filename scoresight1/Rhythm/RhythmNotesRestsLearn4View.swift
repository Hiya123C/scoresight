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

    var body: some View {
        NavigationView {
            VStack {
                // Top Left "X" Button
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
                    // First Hold Button
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

                                Text("HOLD!")
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

                    // Second Hold Button
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

                                Text("HOLD!")
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

                    // Tap Buttons with Alert
                    ForEach(0..<2) { _ in
                        VStack {
                            Image("crochet rest") // Replace with your rest image
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
                }

                Spacer()

                // Bottom Navigation Buttons
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
                    Button(action: {}) {
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
                .padding([.leading, .trailing, .bottom], 20)
            }
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .onDisappear {
            stopTimers()
            stopMetronome()
        }
    }

    private func startHoldButton(isFirstButton: Bool) {
        stopMetronome() // Stop any ongoing metronome

        if isFirstButton {
            isFirstButtonHeld = true
            firstButtonProgress = 0.0
            playMetronome(forBeats: 4) // Loop metronome for 4 beats on first button hold
            animateButtonProgress(isFirstButton: true)
        } else {
            isSecondButtonHeld = true
            secondButtonProgress = 0.0
            playMetronome(forBeats: 1) // Play 1 beat for second button hold
            animateButtonProgress(isFirstButton: false)

            // Schedule two additional beats after releasing the second hold button
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                playMetronome(forBeats: 2)
            }
        }
    }

    private func stopFirstButtonHold() {
        isFirstButtonHeld = false
        stopMetronome() // Stop metronome after release
    }

    private func stopSecondButtonHold() {
        isSecondButtonHeld = false
        stopMetronome() // Stop metronome after release
    }

    private func animateButtonProgress(isFirstButton: Bool) {
        let duration: TimeInterval = 1.0 // Duration of one beat for animation

        if isFirstButton {
            firstTimer?.invalidate() // Invalidate any previous timer
            firstTimer = Timer.scheduledTimer(withTimeInterval: duration / 100, repeats: true) { timer in
                if firstButtonProgress < 1 {
                    firstButtonProgress += 0.01
                } else {
                    timer.invalidate()
                }
            }
        } else {
            secondTimer?.invalidate() // Invalidate any previous timer
            secondTimer = Timer.scheduledTimer(withTimeInterval: duration / 100, repeats: true) { timer in
                if secondButtonProgress < 1 {
                    secondButtonProgress += 0.01
                } else {
                    timer.invalidate()
                }
            }
        }
    }

    // Function to play metronome sound for a specified number of beats
    private func playMetronome(forBeats beats: Int) {
        guard let url = Bundle.main.url(forResource: "metronome1", withExtension: "m4a") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = beats - 1 // Adjust to play the exact number of beats
            audioPlayer?.play()
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
        }
    }

    // Stop metronome sound
    private func stopMetronome() {
        audioPlayer?.stop()
    }

    // Stop any active timers to avoid memory leaks
    private func stopTimers() {
        firstTimer?.invalidate()
        secondTimer?.invalidate()
    }
}

#Preview {
    RhythmNotesRestsLearn4View()
}
