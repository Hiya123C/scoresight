//
//  ClefsPitchedNotesLearn2View.swift
//  scoresight1
//
//  Created by Li Jiansheng on 9/11/24.
//

import SwiftUI
import AVFoundation

private let synthesizer = AVSpeechSynthesizer()

struct ClefsPitchedNotesLearn2View: View {
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
            Text("middle C on the treble clef")
                .font(.system(size: 40))
            Image("treble middle c")
                .resizable()
                .scaledToFit()
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
                    ClefsPitchedNotesLearn3View(isPresented:$isPresented)
                }label:{
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
            speakText("This is where middle C is located on the treble clef. It is named this way as it is the C key in the located middle of the piano.")
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
    speakText("This is where middle C is located on the treble clef. It is named this way as it is the C key in the located middle of the piano.")
}

private func stopAudio() {
    synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    @Previewable @State var isShowing = false
   ClefsPitchedNotesLearn2View(isPresented: $isShowing)
}
