//
//  RhythmNotesRestsLearn5View.swift
//  scoresight1
//
//  Created by T Krobot on 11/11/24.
//

import SwiftUI
import AVFoundation

struct RhythmNotesRestsLearn5View: View {
    private let synthesizer = AVSpeechSynthesizer()
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
                .padding(.top)
                
                Spacer()
                
                HStack (spacing: 70) {
                    Image("quaver")
                        .resizable()
                        .scaledToFit()
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("This is a")
                            .font(.system(size: 40))
                        Text("quaver")
                            .font(.system(size: 80))
                            .bold()
                        Text("note")
                            .font(.system(size: 40))
                    }
                }
                .padding()
                
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
                    HStack {
                        Button(action: {
                            replayAudio()
                        }) {
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(.black)
                                .padding(.trailing, 20)
                        }
                        NavigationLink(destination: RhythmNotesRestsLearn6View(isPresented:$isPresented)) {
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
                .padding([.leading, .trailing, .bottom])
            }
            .navigationBarHidden(true)
            .onAppear {
                speakText("This is a quaver. It is half a beat. A crotchet consists of two quavers.")
            }
            .onDisappear {
                synthesizer.stopSpeaking(at: .immediate)
            }
        }
        .navigationBarHidden(true)
    }
    
    private func replayAudio() {
        speakText("This is a quaver. It is half a beat. A crotchet consists of two quavers.")
    }
    
    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        synthesizer.speak(utterance)
    }
}

#Preview {
    @Previewable @State var isShowing = false
    RhythmNotesRestsLearn5View(isPresented: $isShowing)
}
