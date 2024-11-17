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
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    NavigationLink(destination: TimeSignaturesView()) {
                        Image(systemName: "x.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)
                            .font(.system(size: 40))
                    }
                    Spacer()
                    Text("Tutorial")
                        .font(.headline)
                        .foregroundColor(.black)
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
                        }
                        .foregroundColor(.black)
                        .font(.headline)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                HStack(alignment: .center) {
                    VStack {
                        Text("6")
                            .font(.system(size: 80))
                            .bold()
                        Text("8")
                            .font(.system(size: 80))
                            .bold()
                    }
                    
                    HStack(spacing: 24) {
                        ForEach(0..<beatsInMeasure, id: \.self) { index in
                            ZStack {

                                Circle()
                                    .fill(tappedCircles[index] == nil ? Color.white : (tappedCircles[index] == "Perfect" ? Color.green : Color.red))
                                    .frame(width: onBeats.contains(index) ? 100 : 50, height: onBeats.contains(index) ? 100 : 50)
                                    .overlay(
                                        Circle().stroke(Color.black, lineWidth: 2)
                                    )
                                    .onTapGesture {
                                        if !metronomeStarted && index == 0 {
                                            startMetronome()
                                            metronomeStarted = true
                                        }
                                        
                     
                                        if onBeats.contains(index) {
                            
                                            if index == currentBeat {
                                                tappedCircles[index] = "Perfect"
                                            }
                                        } else {
                                            tappedCircles[index] = "Don't Tap"
                                        }
                                    }
                                
                                // Show text below the tapped circle based on the feedback
                                if let feedback = tappedCircles[index] {
                                    Text(feedback)
                                        .font(.caption)
                                        .foregroundColor(feedback == "Perfect" ? .green : .red)
                                        .bold()
                                        .padding(.top, 5)
                                }
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
                    metronomeTimer.upstream.connect().cancel() // Stop the timer after 6 beats
                    beatCount = 0 // Reset beat count for the next session
                }
            }
            // Navigate to the TimeSignaturesReviewView when navigateToReview is true
            .navigationDestination(isPresented: $navigateToReview) {
                TimeSignaturesReviewView()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            }
        }
        .navigationBarHidden(true)
    }
    
    // MARK: - Functions
    
    // Starts the metronome by preparing the audio player
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
        metronomePlayer?.currentTime = 0;        metronomePlayer?.play()
    }

    func advanceBeat() {
        currentBeat = (currentBeat + 1) % beatsInMeasure
        beatCount += 1
    }
    
    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        synthesizer.speak(utterance)
    }

    private func replayAudio() {
        speakText("Here’s a tutorial to differentiate on beat and off beat notes. The largest circles represent the on-beats. The smaller circles represent off beats. Tap on all on beats! Do not tap on off beats. Press skip to go to the review.")
    }
}

#Preview{
    TimeSignaturesLearn9View()
}
