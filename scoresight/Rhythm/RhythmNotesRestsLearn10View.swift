//
//  RhythmNotesRestsLearn10View.swift
//  scoresight1
//
//  Created by T Krobot on 12/11/24.
//

import SwiftUI
import AVFoundation

struct RhythmNotesRestsLearn10View: View {
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

                HStack (spacing: 70){
                    Image("demisemiquaver rest")
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .trailing) {
                        Text("this is a")
                            .font(.system(size: 40))
                        Text("demisemiquaver")
                            .font(.system(size: 60))
                            .bold()
                        Text("rest")
                            .font(.system(size: 40))
                    }
                }

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
                        speakText("This is a demisemiquaver rest. Similar to the demisemiquaver note, it is one sixteenth of a beat long. However, instead of holding the note, you don't play for a sixteenth of a beat.")
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .padding(.trailing, 20)
                    }

                    NavigationLink(destination: RhythmNotesRestsLearn11View(isPresented:$isPresented)) {
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
                .padding()
            }
            .navigationBarHidden(true)
            .onAppear {
                speakText("This is a demisemiquaver rest. Similar to the demisemiquaver note, it is one sixteenth of a beat long. However, instead of holding the note, you don't play for a sixteenth of a beat.")
            }
            .onDisappear {
                stopSpeech()
            }
        }
        .navigationBarHidden(true)
    }

    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        synthesizer.speak(utterance)
    }

    private func stopSpeech() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}

#Preview {
    @Previewable @State var isShowing = false
    RhythmNotesRestsLearn10View(isPresented: $isShowing)
}
