//
//  RhythmNotesRestsLearn2.swift
//  scoresight1
//
//  Created by T Krobot on 10/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct RhythmNotesRestsLearn2View: View {
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented:Bool
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
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
                
                HStack {
                    Image("semibreve rest")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100)
                    Spacer()
                    Spacer()
                }
                
                Button(action: {
                    showAlert = true
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color.red)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        Text("TAP!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .frame(width: 600, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black, lineWidth: 2)
                    )
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Warning"), message: Text("Do not play during a rest"), dismissButton: .default(Text("OK")))
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
                    .padding(.leading, 10)
                    
                    Spacer()
                    Button(action: {
                        replayAudio()
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(.black)
                            .padding(.trailing, 10)
                    }
                    NavigationLink(destination: RhythmNotesRestsLearn3View(isPresented:$isPresented)) {
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
                .onAppear {
                    speakText("This is a semibreve rest. Do not play it for four beats. Thus, do not tap the button.")
                }
            }
            .navigationBarBackButtonHidden(true)
            .onDisappear {
                stopAudio()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        synthesizer.speak(utterance)
    }
    
    private func replayAudio() {
        speakText("This is a semibreve rest. Do not play it for four beats. Thus, do not tap the button.")
    }
    
    private func stopAudio() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    @Previewable @State var isShowing = false
    RhythmNotesRestsLearn2View(isPresented: $isShowing)
}
