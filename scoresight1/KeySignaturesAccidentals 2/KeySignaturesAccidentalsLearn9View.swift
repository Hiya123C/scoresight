//
//  KeySignaturesAccidentalsLearn9View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 11/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct KeySignaturesAccidentalsLearn9View: View {
    
    @State private var opacities: [Double] = Array(repeating: 0, count: 8) // Start all images hidden
    @State private var currentIndex = 0
    let animationDuration: Double = 1.0  // Duration for fade in/out
    let delayBetweenImages: Double = 0.5 // Delay before showing next image
    
    // Define positions for each sharp relative to the staff
    let positions: [(x: CGFloat, y: CGFloat)] = [
        (x: 0, y: 0),
        (x: 3, y: -3),
        (x: 3, y: -3),
        (x: -1, y: -4),
        (x: 1, y: -3),
        (x: 2, y: -3),
        (x: 2, y: -3),
        (x: 3, y: -3)
    ]
    
    func startAnimation() {
        func animateNext() {
            guard currentIndex < 8 else {
                // Reset and start over
                currentIndex = 0
                opacities = Array(repeating: 0, count: 8)
                startAnimation()
                return
            }
            
            // Fade in current image
            withAnimation(.easeIn(duration: animationDuration)) {
                opacities[currentIndex] = 1
            }
            
            // If there's a previous image, fade it out after current image is fully visible
            DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                if currentIndex <= 7 {
                    withAnimation(.easeOut(duration: animationDuration)) {
                        opacities[currentIndex - 1] = 0
                    }
                }
                
                // Move to next image after current fade completes
                currentIndex += 1
                
                // Schedule next animation
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                    animateNext()
                }
            }
        }
        
        // Start the animation sequence
        animateNext()
    }
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink{
                    KeySignaturesAccidentalsView()
                } label:{
                    Image(systemName: "x.circle")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .font(.system(size:50))
                }
                Spacer()
            }
            
            ZStack {
                ForEach(0..<8) { index in
                    Image(index == 0 ? "bass flat" :
                          index == 1 ? "bass flat b" :
                          index == 2 ? "bass flat e" :
                          index == 3 ? "bass flat a" :
                          index == 4 ? "bass flat d" :
                          index == 5 ? "bass flat g" :
                          index == 6 ? "bass flat c" :
                          "bass flat f")
                        .resizable()
                        .scaledToFit()
                        .opacity(opacities[index])
                        .offset(x: positions[index].x, y: positions[index].y)
                }
            }
            .onAppear {
                startAnimation()
            }
            
            HStack{
                NavigationLink{
                    KeySignaturesAccidentalsLearn8View()
                } label:{
                    Text("back")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 3)
                                .frame(width:100,height:50)
                            
                        )
                        .foregroundStyle(.black)
                        .font(.system(size: 25))
                    Spacer()
                    Button(action: {
                        replayAudio()
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                    }
                }
                NavigationLink{
                    KeySignaturesAccidentalsLearn10View()
                } label:{
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
            speakText(" this is how flats appear on the bass clef, but it is always arranged in this note order from down to up to down again no matter the clef.")
        }
        .onDisappear {
            stopAudio()
        }
        .navigationBarHidden(true)
    }
    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        synthesizer.speak(utterance)
    }
    
    private func replayAudio() {
        speakText(" this is how flats appear on the bass clef, but it is always arranged in this note order from down to up to down again no matter the clef.")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    KeySignaturesAccidentalsLearn9View()
}
