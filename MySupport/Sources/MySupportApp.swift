
import SwiftUI
import AppKit

@main
struct MySupportApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
        .commands {
            // Убираем пункты меню, которые нам не нужны
            CommandGroup(replacing: .appInfo) {}
            CommandGroup(replacing: .newItem) {}
            CommandMenu("Настройки") {
                Button("Открыть настройки") {
                    showSettings()
                }
                .keyboardShortcut(",", modifiers: .command)
            }
        }
    }
    
    func showSettings() {
        appDelegate.showSettings()
    }
}
