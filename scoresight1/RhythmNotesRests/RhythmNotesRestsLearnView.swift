//
//  RhythmNotesRests2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI
import AVFoundation

struct RhythmNotesRestsLearnview: View {
    @State private var progress: CGFloat = 0.0
    @State private var beatCount = 0
    @State private var isPressed = false
    @State private var isNextVisible = true
    @State private var showError = false
    @State private var metronomePlayer: AVAudioPlayer?
    @State private var metronomePlays: Bool = false
    @State private var metronomeStopped: Bool = false
    
    func setupMetronome() {
        if let soundURL = Bundle.main.url(forResource: "metronome", withExtension: "m4a") {
            metronomePlayer = try? AVAudioPlayer(contentsOf: soundURL)
            metronomePlayer?.numberOfLoops = -1
            metronomePlayer?.prepareToPlay()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink{
                    RhythmNotesRestsView()
                } label:{
                    Image(systemName: "x.circle")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .font(.system(size:50))
                        .position(x:0,y:50)//find out how to replace position
                }
                
                HStack {
                    Image("semibreve")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100)
                        .padding(.leading, 30)
                    Spacer()
                }
                .padding(.bottom, 10)
                
                Spacer()
                
                Button(action: {}) {
                    ZStack {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: min(progress, 600), height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 15))

                        Text("HOLD!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .frame(width: 600, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 2)
                    )
                }
                .onLongPressGesture(minimumDuration: 0.1, perform: {
                    startHolding()
                })
                .onLongPressGesture(maximumDistance: 10) {
                    
                } onPressingChanged: { pressed in
                    print("isPressed", isPressed)
                    isPressed = pressed
                    startMetronome()
                }
                
                if showError {
                    Text("Tap on button only on a beat")
                        .foregroundColor(.red)
                        .font(.headline)
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: RhythmNotesRestsLearn2View()) {
                        Text("Next")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 3)
                                    .frame(width: 100, height: 50)
                            )
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                    }
                    .padding(.trailing, 10)
                }
                .padding(.bottom, 30)
            }
            .onAppear {
                setupMetronome()
            }
            .onDisappear {
                stopMetronome()
            }
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func startHolding() {
        showError = false
        print("startedHolding")
        
        if beatCount % 4 == 0 {
            progress = 0
        } else {
            showError = true
        }
    }
    
    private func stopHolding() {
    }
    
    private func startMetronome() {
        if !metronomePlays && !metronomeStopped {
            metronomePlayer?.play()
            metronomePlays = true
        }
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if !isNextVisible {
                timer.invalidate()
                return
            }
            
            if metronomeStopped {
                timer.invalidate()
                return
            }
            
            beatCount += 1
            
            if beatCount > 4 {
                beatCount = 1
                progress = 0
            }
            
            
            if isPressed && beatCount <= 4 {
                progress = CGFloat(beatCount) * 150
            }
            
            if progress >= 600 {
                metronomePlayer?.pause()
                metronomePlays = false
                metronomeStopped = true
            }
        }
    }
    
    private func stopMetronome() {
        metronomePlayer?.stop()
        metronomePlays = false
        metronomeStopped = true
    }
}

#Preview {
    RhythmNotesRestsLearnview()
}
