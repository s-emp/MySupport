//
//  LabeledTextField.swift
//  MySupport
//
//  Created by Emp on 20.03.2025.
//
import SwiftUI
import AppKit
import OSLog

struct LabeledTextField: View {
    
    @Binding var text: String  // Привязка к значению поля
    let labelText: String      // Текст, отображаемый над полем ввода
    let placeholder: String // Текст-подсказка в поле
    var onNavigate: (() -> Void)? = nil
    
    private let logger = Logger(subsystem: "UI", category: "Component")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(labelText)
                .font(.footnote)
                .foregroundColor(.secondary)
            
            HStack {
                TextField(placeholder, text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: .infinity)
                Button(action: onNavigate ?? { }) {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 16))
                        .foregroundStyle(.secondary)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    LabeledTextField(text: .constant(""), labelText: "Путь до FMS", placeholder: "")
}
