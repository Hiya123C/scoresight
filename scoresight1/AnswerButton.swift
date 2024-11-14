import SwiftUI

struct AnswerButton: View {
    let label: String
    let isSelected: Bool
    let isCorrect: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(isSelected ? (isCorrect ? Color.green : Color.red) : Color.clear)
                Text(label)
                    .padding()
                    .foregroundColor(isSelected ? .black : .black)
                    .font(.system(size: 25))
            }
            
        }
    }
}
