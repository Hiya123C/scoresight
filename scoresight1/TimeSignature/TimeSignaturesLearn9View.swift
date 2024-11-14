//
//  TimeSIgnaturesLearn9View.swift
//  scoresight1
//
//  Created by T Krobot on 13/11/24.
//

import SwiftUI
import AVFoundation

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
                    NavigationLink(destination: TimeSignaturesReviewView()) {
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
                    
                    // Button that triggers navigation to TimeSignaturesReviewView on tap
                    Button(action: {
                        navigateToReview = true // Set state to trigger navigation
                    }) {
                        Text("Skip")
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
                                // Circle starts as white and turns yellow on tap
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
            .onReceive(metronomeTimer) { _ in
                if metronomeStarted && beatCount < beatsInMeasure { // Only play for the first 6 beats
                    playMetronomeSound()
                    advanceBeat()
                } else if beatCount >= beatsInMeasure {
                    metronomeTimer.upstream.connect().cancel() // Stop the timer after 6 beats
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
}

#Preview{
    TimeSignaturesLearn9View()
}
