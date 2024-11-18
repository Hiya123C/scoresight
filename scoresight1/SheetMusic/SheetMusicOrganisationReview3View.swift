//

import SwiftUI

struct SheetMusicOrganisationReview3View: View {
    
    @State private var selectedAnswer: String? = nil
    @State private var correctAnswer: Bool = false
    @State private var wrongAnswer: Bool = false
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
                    
                    Spacer()
                    VStack {
                        Text("Which direction should the stave be pointing at?")
                            .font(.system(size: 40))
                        
                        Image("treble A")
                            .resizable()
                            .scaledToFit()
                        
                        HStack {
                            Spacer()
                            AnswerButton(label: "up", isSelected: selectedAnswer == "up", isCorrect: true) {
                                selectedAnswer = "up"
                                correctAnswer = true
                                wrongAnswer = false
                                print("correct")
                            }
                            Spacer()
                            AnswerButton(label: "down", isSelected: selectedAnswer == "down", isCorrect: false) {
                                selectedAnswer = "down"
                                correctAnswer = false
                                wrongAnswer = true
                                print("wrong")
                            }
                            Spacer()
                            AnswerButton(label: "up or down", isSelected: selectedAnswer == "up or down", isCorrect: false) {
                                selectedAnswer = "up or down"
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
                                SheetMusicOrganisationReview4View(isPresented:$isPresented)
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
                            Text("Correct! The stave should be pointing up.")
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
                }.navigationBarBackButtonHidden(true)
            }
    }
}

#Preview {
    @Previewable @State var isShowing = false
    SheetMusicOrganisationReview3View(isPresented:$isShowing)
}
