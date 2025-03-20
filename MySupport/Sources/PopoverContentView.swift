import SwiftUI

struct PopoverContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Hello World!")
                .font(.title)
                .padding()
            
            Text("Это ваше приложение в статус-баре")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(width: 300, height: 200)
        .padding()
    }
}

#Preview {
    PopoverContentView()
}
