//add play button

import SwiftUI
import AVFoundation

struct SheetMusicOrganisationLearn9View: View {
    @State private var synthesizer = AVSpeechSynthesizer()
    @State private var isSpeaking = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlayingAudio = false
    
    func playAudio() {
        guard let soundURL = Bundle.main.url(forResource: "repeat sign", withExtension: "mp3") else {
            print("Audio cannot find.") 
            return
        }
        do {
            if audioPlayer == nil {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.numberOfLoops = 0
            }
            
            if let player = audioPlayer {
                if isPlayingAudio {
                    player.pause()
                } else {
                    player.play()
                }
                isPlayingAudio.toggle()
            }
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
        }
    }
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented:Bool
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
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
                VStack{
                    Spacer()
                    HStack{
                        Image("repeatsign")
                            .resizable()
                            .scaledToFit()
                        
                        Button(action: {
                            playAudio()
                        }) {
                            Image(systemName: isPlayingAudio ? "pause.circle" : "play.circle")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .black)
                                .font(.system(size: 50))
                        }
                    }
                    Spacer()
                    
                    HStack(alignment:.center){
                        Text("this is a")
                            .font(.system(size: 45))
                        Text("repeat sign")
                            .font(.system(size:60))
                            .bold()
                        Spacer()
                    }
                }
                .frame(maxHeight:.infinity)
                
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
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.system(size: 25))
                        .padding(.trailing, 20)
                        .foregroundStyle(.black)
                        .onTapGesture {
                            if isSpeaking {
                                stopSpeech()
                            } else {
                                speakText("With a repeat sign, the bars to the left of the sign will be repeated once.")
                            }
                            isSpeaking.toggle()
                        }
                    
                    NavigationLink{
                        SheetMusicOrganisationLearn10View(isPresented:$isPresented)
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
            }
            
        }
        .onAppear {
            speakText("With a repeat sign, the bars to the left of the sign will be repeated once.")
        }
        .onDisappear {
            stopSpeech()
            stopAudio()
        }
        .navigationBarBackButtonHidden(true)
        
    }
    private func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        synthesizer.speak(utterance)
    }
    
    private func stopSpeech() {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
        isSpeaking = false
    }
    
    private func stopAudio() {
        audioPlayer?.stop()
        audioPlayer = nil
        isPlayingAudio = false
    }
}

#Preview {
    @Previewable @State var isShowing = false
    SheetMusicOrganisationLearn9View(isPresented: $isShowing)
}
