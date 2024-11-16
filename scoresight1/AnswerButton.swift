import SwiftUI

struct AnswerButton: View {
    let label: String
    let isSelected: Bool
    let isCorrect: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .padding()
                .foregroundColor(isSelected ? .black : .black)
                .font(.system(size: 25))
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isSelected ? (isCorrect ? Color.green : Color.red) : Color.clear)
                   
                )
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 3)
                )
        }
    }
}


#Preview {
    AnswerButton(label: "test", isSelected: true, isCorrect: true, action: {})
}
