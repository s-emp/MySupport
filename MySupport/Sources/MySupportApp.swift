
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
        }
    }
}
