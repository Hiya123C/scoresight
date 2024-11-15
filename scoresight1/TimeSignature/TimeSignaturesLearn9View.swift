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
    // Timer properties
    @State private var currentBeat = 0
    private let bpm = 60
    private let beatsInMeasure = 6 // 6/8 time signature, six beats per measure
    private let onBeats = [0, 3] // assuming on-beats are at positions 0 and 3 in the measure
    
    // Metronome sound player
    @State private var metronomePlayer: AVAudioPlayer?
    
    // Timer set to 1 second for 60 BPM
    private let metronomeTimer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State private var beatCount = 0 // New variable to count beats
    
    // States to manage tapping and feedback
    @State private var metronomeStarted = false
    @State private var tappedCircles: [Int: String] = [:] // To store tapped circle info (Perfect/Don't Tap)
    @State private var navigateToReview = false // State for skip navigation
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header with close button, title, and skip button
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
                    
                    // Speaker and Skip buttons
                    HStack {
                        Button(action: { replayAudio() }) {
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(.black)
                                .padding(.trailing, 10)
                        }
                        Button("Skip") {
                            navigateToReview = true // Set state to trigger navigation
                        }
                        .foregroundColor(.black)
                        .font(.headline)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Main content
                HStack(alignment: .center) {
                    // Larger numbers to indicate time signature
                    VStack {
                        Text("6")
                            .font(.system(size: 80))
                            .bold()
                        Text("8")
                            .font(.system(size: 80))
                            .bold()
                    }
                    
                    // Circle elements with on-beats and off-beats
                    HStack(spacing: 24) {
                        ForEach(0..<beatsInMeasure, id: \.self) { index in
                            ZStack {
                                // Circle starts as white and turns green or red based on tap
                                Circle()
                                    .fill(tappedCircles[index] == nil ? Color.white : (tappedCircles[index] == "Perfect" ? Color.green : Color.red))
                                    .frame(width: onBeats.contains(index) ? 100 : 50, height: onBeats.contains(index) ? 100 : 50)
                                    .overlay(
                                        Circle().stroke(Color.black, lineWidth: 2)
                                    )
                                    .onTapGesture {
                                        // Start metronome only on the first on-beat (index 0)
                                        if !metronomeStarted && index == 0 {
                                            startMetronome()
                                            metronomeStarted = true
                                        }
                                        
                                        // Handle taps and feedback
                                        if onBeats.contains(index) {
                                            // Check if tapped close to the metronome's current beat
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
    
    // Plays the metronome sound
    func playMetronomeSound() {
        metronomePlayer?.stop()  // Stop any ongoing playback to avoid overlapping sounds
        metronomePlayer?.currentTime = 0  // Reset to the beginning of the sound
        metronomePlayer?.play()
    }
    
    // Advances to the next beat and toggles on/off-beat state
    func advanceBeat() {
        currentBeat = (currentBeat + 1) % beatsInMeasure
        beatCount += 1 // Increment beat counter
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
