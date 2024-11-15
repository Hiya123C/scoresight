import SwiftUI

struct BarView: View{
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 4)
            VStack(spacing: 21) {
                Rectangle()
                    .frame(height: 4)
                Rectangle()
                    .frame(height: 4)
                Rectangle()
                    .frame(height: 4)
                Rectangle()
                    .frame(height: 4)
                Rectangle()
                    .frame(height: 4)
            }
            Rectangle()
                .frame(width: 4)
        }
        .frame(height: 104)
    }
}
