//
//  SettingsView.swift
//  MySupport
//
//  Created by Emp on 20.03.2025.
//


import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Настройки")
                .font(.title)
                .bold()
            
            Divider()
            
            // Здесь можно добавить различные настройки
            Text("Общие настройки")
                .font(.headline)
            
            Toggle("Уведомления", isOn: .constant(true))
            Toggle("Темная тема", isOn: .constant(false))
            
            Spacer()
            
            Button("Закрыть") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
        .frame(width: 350, height: 400)
    }
}

#Preview {
    SettingsView()
}