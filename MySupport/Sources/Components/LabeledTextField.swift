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
    @Binding var isError: Bool
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
                    .disabled(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(isError ? Color.red : Color.clear, lineWidth: 2)
                    )
                    .frame(maxWidth: .infinity)
                    .onChange(of: text) {
                        isError = false
                    }
                    
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
    LabeledTextField(text: .constant(""), isError: .constant(false), labelText: "Путь до FMS", placeholder: "")
}
