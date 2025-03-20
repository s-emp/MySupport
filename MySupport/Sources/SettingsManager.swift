import SwiftUI

class SettingsManager: ObservableObject {
    @Published var settings: SettingModel {
        didSet {
            save()
        }
    }
    
    // Ключи для UserDefaults
    private enum UserDefaultsKeys {
        static let settings = "settings"
    }
    
    init() {
        self.settings = SettingsManager.load()
    }
    
    // Загрузка настроек
    private static func load() -> SettingModel {
        guard let data = UserDefaults.standard.data(forKey: UserDefaultsKeys.settings) else {
            return SettingModel()
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(SettingModel.self, from: data)
        } catch {
            print("Ошибка при загрузке настроек: \(error)")
            return SettingModel()
        }
    }
    
    // Сохранение настроек
    private func save() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(settings)
            UserDefaults.standard.set(data, forKey: UserDefaultsKeys.settings)
        } catch {
            print("Ошибка при сохранении настроек: \(error)")
        }
    }
}

// Environment key для доступа к настройкам
private struct SettingsManagerKey: EnvironmentKey {
    static let defaultValue = SettingsManager()
}

extension EnvironmentValues {
    var settingsManager: SettingsManager {
        get { self[SettingsManagerKey.self] }
        set { self[SettingsManagerKey.self] = newValue }
    }
}
