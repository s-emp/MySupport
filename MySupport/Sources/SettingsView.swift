import SwiftUI
import AppKit

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.settingsManager) private var settingsManager
    
    // Локальное состояние для редактирования, которое будет сохранено только при нажатии "Сохранить"
    @State private var sfPath: String = ""
    @State private var fmsPath: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Настройки")
                .font(.title)
                .bold()
            
            Divider()
            
            Text("Пути к приложениям")
                .font(.headline)
            
            LabeledTextField(
                text: $sfPath,
                labelText: "Путь до SF",
                placeholder: "Выберите путь до SF",
                onNavigate: {
                    selectSFPath()
                }
            )
            
            LabeledTextField(
                text: $fmsPath,
                labelText: "Путь до FMS",
                placeholder: "Выберите путь до FMS",
                onNavigate: {
                    selectFMSPath()
                }
            )
            
            Spacer()
            
            HStack {
                Button("Отмена") {
                    dismiss()
                }
                .keyboardShortcut(.escape, modifiers: [])
                
                Spacer()
                
                Button("Сохранить") {
                    saveSettings()
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .keyboardShortcut(.return, modifiers: [])
            }
        }
        .padding()
        .frame(minWidth: 350, minHeight: 400)
        .onAppear {
            // Загружаем текущие настройки при отображении View
            sfPath = settingsManager.settings.sfPath
            fmsPath = settingsManager.settings.fmsPath
        }
    }
    
    // Функция сохранения настроек
    private func saveSettings() {
        var updatedSettings = settingsManager.settings
        updatedSettings.sfPath = sfPath
        updatedSettings.fmsPath = fmsPath
        settingsManager.settings = updatedSettings
    }
    
    // Функция выбора пути до SF
    private func selectSFPath() {
        let openPanel = NSOpenPanel()
        openPanel.title = "Выберите папку SF"
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = true
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = false
        openPanel.allowedContentTypes = [.folder]
        
        if openPanel.runModal() == .OK {
            if let url = openPanel.url {
                sfPath = url.path
            }
        }
    }
    
    // Функция выбора пути до FMS
    private func selectFMSPath() {
        let openPanel = NSOpenPanel()
        openPanel.title = "Выберите папку FMS"
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = true
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = false
        openPanel.allowedContentTypes = [.folder]
        
        if openPanel.runModal() == .OK {
            if let url = openPanel.url {
                fmsPath = url.path
            }
        }
    }
}
