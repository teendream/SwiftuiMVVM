//
//  SettingViewModel.swift
//  InterviewApp
//
//  Created by Azizbek Abdulkhakimov on 10/05/23.
//

import Foundation

class SettingViewModel: ObservableObject {
    @Published var settings: [SettingType] = []
    private let settingProvider: SettingProvider
    private let settingsRepository: SettingsRepository
    
    init(settingProvider: SettingProvider, settingsRepository: SettingsRepository) {
        self.settingProvider = settingProvider
        self.settingsRepository = settingsRepository
        self.settings = settingProvider.settings
    }
    
    func saveSettings() {
        for setting in settings {
            if let firebaseSetting = setting as? FirebaseSetting {
                settingsRepository.save(firebaseSetting)
            }
        }
    }
}
