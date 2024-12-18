//crashed

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct KeySignaturesAccidentalsLearn7View: View {
   
    @State private var opacities: [Double] = Array(repeating: 0, count: 8) // Start all images hidden
    @State private var currentIndex = 0
    let animationDuration: Double = 0.5 // Duration for fade in/out
    let delayBetweenImages: Double = 0.2 // Delay before showing next image
    
    // Define positions for each sharp relative to the staff
    let positions: [(x: CGFloat, y: CGFloat)] = [
        (x: 0, y: 0),
        (x: 8, y: -3),
        (x: 3, y: -2),
        (x: 1, y: 0),
        (x: 0, y: 4),
        (x: 0, y: 0),
        (x: 0, y: 0),
        (x: -3, y: -2)
    ]
    
    func startAnimation() {
        func animateNext() {
            guard currentIndex != 8 else {
                return
            }
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
                if currentIndex != 0 && currentIndex <= 7 {
                    withAnimation(.easeOut(duration: animationDuration)) {
                        opacities[currentIndex-1] = 0
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
                
                ZStack {
                    ForEach(0..<8) { index in
                        Image(index == 0 ? "treble sharp" :
                                index == 1 ? "treble sharp f 1" :
                                index == 2 ? "treble sharp c 1" :
                                index == 3 ? "treble sharp g 1" :
                                index == 4 ? "treble sharp d 1" :
                                index == 5 ? "treble sharp a 1" :
                                index == 6 ? "treble sharp e 1" :
                                "treble sharp b")
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
                        KeySignaturesAccidentalsLearn8View(isPresented:$isPresented)
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
                speakText("This is how sharps appear on the treble clef, but it is always arranged in this note order from up to down no matter the clef.")
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
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        synthesizer.speak(utterance)
    }
    
    private func replayAudio() {
        speakText("This is how sharps appear on the treble clef, but it is always arranged in this note order from up to down no matter the clef.")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    @Previewable @State var isShowing = false
   KeySignaturesAccidentalsLearn7View(isPresented: $isShowing)
}
