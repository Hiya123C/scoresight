//
//  TimeSIgnaturesLearn9View.swift
//  scoresight1
//
//  Created by T Krobot on 13/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct TimeSignaturesLearn9View: View {
    @State private var currentBeat = 0
    private let bpm = 60
    private let beatsInMeasure = 6
    private let onBeats = [0, 3]
    @State private var metronomePlayer: AVAudioPlayer?
    private let metronomeTimer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State private var beatCount = 0
    @State private var metronomeStarted = false
    @State private var tappedCircles: [Int: String] = [:]
    @State private var navigateToReview = false
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button(action: {
                        resetTutorial()
                        isPresented = false
                    }) {
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size: 50))
                    }
                    Spacer()

                    HStack {
                        Button(action: { replayAudio() }) {
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(.black)
                                .padding(.trailing, 10)
                        }
                        Button("Skip") {
                            navigateToReview = true
                            resetTutorial()
                        }
                        .foregroundColor(.black)
                        .font(.headline)
                    }
                }
                .padding(.horizontal)

                Spacer()

                // Main Content Section
                HStack(alignment: .center) {
                    VStack {
                        Text("6")
                            .font(.system(size: 80))
                            .bold()
                        Text("8")
                            .font(.system(size: 80))
                            .bold()
                    }

                    // Beat Circles
                    HStack(spacing: 24) {
                        ForEach(0..<beatsInMeasure, id: \.self) { index in
                            VStack(spacing: 5) {
                                ZStack {
                                    Circle()
                                        .fill(tappedCircles[index] == nil ? Color.white : (tappedCircles[index] == "Perfect" ? Color.green : Color.red))
                                        .frame(width: onBeats.contains(index) ? 100 : 50, height: onBeats.contains(index) ? 100 : 50)
                                        .overlay(
                                            Circle().stroke(Color.black, lineWidth: 2)
                                        )
                                        .onTapGesture {
                                            handleTap(for: index)
                                        }
                                }

                                // Feedback Text
                                Text(tappedCircles[index] ?? "") // Show feedback or empty space
                                    .font(.caption)
                                    .foregroundColor(tappedCircles[index] == "Perfect" ? .green : .red)
                                    .bold()
                                    .multilineTextAlignment(.center) // Ensure text stays within bounds
                                    .frame(maxWidth: 80) // Limit width to avoid overflow
                            }
                        }
                    }
                    .padding(.leading, 20)
                }

                Spacer()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                speakText("Here’s a tutorial to differentiate on beat and off beat notes. The largest circles represent the on-beats. The smaller circles represent off beats. Tap on all on beats! Do not tap on off beats. Press skip to go to the review.")
            }
            .onReceive(metronomeTimer) { _ in
                if metronomeStarted && beatCount < beatsInMeasure {
                    playMetronomeSound()
                    advanceBeat()
                } else if beatCount >= beatsInMeasure {
                    stopMetronome()
                }
            }
            .navigationDestination(isPresented: $navigateToReview) {
                TimeSignaturesReviewView(isPresented: $isPresented)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            }
        }
        .navigationBarHidden(true)
    }

    func handleTap(for index: Int) {
        if !metronomeStarted && index == 0 {
            startMetronome()
            metronomeStarted = true
        }

        if onBeats.contains(index) {
            tappedCircles[index] = index == currentBeat ? "Perfect" : ""
        } else {
            tappedCircles[index] = "Don't Tap"
        }
    }

    func startMetronome() {
        guard let url = Bundle.main.url(forResource: "metronome", withExtension: "m4a") else {
            print("Metronome sound file not found")
            return
        }
        metronomePlayer = try? AVAudioPlayer(contentsOf: url)
        metronomePlayer?.prepareToPlay()
    }

    func playMetronomeSound() {
        metronomePlayer?.stop()
        metronomePlayer?.currentTime = 0
        metronomePlayer?.play()
    }

    func advanceBeat() {
        currentBeat = (currentBeat + 1) % beatsInMeasure
        beatCount += 1
    }

    func stopMetronome() {
        metronomeTimer.upstream.connect().cancel()
        beatCount = 0
    }

    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        synthesizer.speak(utterance)
    }

    private func replayAudio() {
        speakText("Here’s a tutorial to differentiate on beat and off beat notes. The largest circles represent the on-beats. The smaller circles represent off beats. Tap on all on beats. Do not tap on off beats. Press skip to go to the review.")
    }

    func resetTutorial() {
        currentBeat = 0
        beatCount = 0
        metronomeStarted = false
        tappedCircles.removeAll()
    }
}

#Preview {
    @Previewable @State var isShowing = false
    TimeSignaturesLearn9View(isPresented: $isShowing)
}
