//
//  TimeSignaturesLearn8View.swift
//  scoresight1
//
//  Created by T Krobot on 13/11/24.
//

import SwiftUI
import AVFoundation
private let synthesizer = AVSpeechSynthesizer()
struct TimeSignaturesLearn8View: View {
    @State private var topNumber: Int = 3
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented:Bool
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
                .padding(.top, 10)
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("\(topNumber)")
                            .font(.system(size: 90))
                            .fontWeight(.bold)
                        Text("8")
                            .font(.system(size: 90))
                            .fontWeight(.bold)
                    }
                    
                    ForEach(0..<topNumber, id: \.self) { _ in
                        Image("quaver")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 20)
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
                    
                    Spacer()
                    
                    Button(action: {
                        if topNumber > 3 {
                            topNumber -= 1
                        }
                    }) {
                        Text("-")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                    }
                    
                    Button(action: {
                        if topNumber < 6 {
                            topNumber += 1
                        }
                    }) {
                        Text("+")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    Button(action: {
                        replayAudio()
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                    }
                    NavigationLink(destination: TimeSignaturesLearn9View(isPresented:$isPresented)) {
                        Text("next")
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                    }
                }
                .padding()
            }
            .onAppear {
                speakText("Find out how the bar changes when you press the plus and minus buttons. The limit is 3 to 6.")
            }
            .onDisappear {
                stopAudio()
            }
            .padding()
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
        speakText("Find out how the bar changes when you press the plus and minus buttons. The limit is 3 to 6.")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    @Previewable @State var isShowing = false
   TimeSignaturesLearn8View(isPresented: $isShowing)
}
