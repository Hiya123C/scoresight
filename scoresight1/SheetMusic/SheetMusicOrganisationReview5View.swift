//

import SwiftUI

struct SheetMusicOrganisationReview5View: View {
    @State private var selectedAnswer: String? = nil
    @State private var correctAnswer: Bool = false
    @State private var wrongAnswer: Bool = false
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    HStack {
                        NavigationLink {
                            SheetMusicOrganisationView()
                        } label: {
                            Image(systemName: "x.circle")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .white)
                                .font(.system(size: 50))
                        }
                        Spacer()
                    }
                    Spacer()
                    
                    VStack {
                        Text("What is this?")
                            .font(.system(size: 40))
                        
                        Image("sharp")
                            .resizable()
                            .scaledToFit()
                        
                        HStack {
                            Spacer()
                            AnswerButton(label: "time signature", isSelected: selectedAnswer == "time signature", isCorrect: false) {
                                selectedAnswer = "time signature"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "sharp", isSelected: selectedAnswer == "sharp", isCorrect: true) {
                                selectedAnswer = "sharp"
                                correctAnswer = true
                                wrongAnswer = false
                                print("true")
                            }
                            Spacer()
                            AnswerButton(label: "tempo marking", isSelected: selectedAnswer == "tempo marking", isCorrect: false) {
                                selectedAnswer = "tempo marking"
                                correctAnswer = false
                                wrongAnswer = true
                                print("correct")
                            }
                            Spacer()
                            AnswerButton(label: "bass", isSelected: selectedAnswer == "bass", isCorrect: false) {
                                selectedAnswer = "bass"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                        }
                    }
                    
                    Spacer()
                    ZStack {
                        HStack {
                            Spacer()
                            NavigationLink {
                                SheetMusicOrganisationReview5View()
                            } label: {
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
                        if correctAnswer {
                            Text("Correct! It's a sharp!")
                                .font(.system(size: 20))
                                .foregroundColor(.green)
                                .padding(.top, 10)
                        }
                        if wrongAnswer {
                            Text("Wrong! Try again.")
                                .font(.system(size: 20))
                                .foregroundColor(.red)
                                .padding(.top, 10)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SheetMusicOrganisationReview5View()
}
