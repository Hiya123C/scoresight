import SwiftUI

struct KeySignaturesAccidentalsLearn7View: View {
   
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
                    Image(index == 0 ? "treble sharp" :
                          index == 1 ? "treble sharp f" :
                          index == 2 ? "treble sharp c" :
                          index == 3 ? "treble sharp g" :
                          index == 4 ? "treble sharp d" :
                          index == 5 ? "treble sharp a" :
                          index == 6 ? "treble sharp e" :
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
                NavigationLink{
                    KeySignaturesAccidentalsLearn6View()
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
                    
                }
                NavigationLink{
                    KeySignaturesAccidentalsLearn8View()
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
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    KeySignaturesAccidentalsLearn7View()
}
