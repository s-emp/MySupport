import SwiftUI

struct PopoverContentView: View {
    var showSettings: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Spacer()
                Button(action: showSettings) {
                    Image(systemName: "gearshape")
                        .font(.system(size: 14))
                }
                .buttonStyle(.plain)
                .padding(.zero)
            }
            .padding(.horizontal)
            .frame(height: .zero)
            
            Text("Hello World!")
                .font(.title)
                .padding()
            
            Text("Это ваше приложение в статус-баре")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding(.top)
        .frame(width: 300)
    }
}
