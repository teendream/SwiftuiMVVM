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
    private let settingRepository: SettingsRepository

    init(settingProvider: SettingProvider, settingRepository: SettingsRepository) {
        self.settingProvider = settingProvider
        self.settingRepository = settingRepository

        setupArr()
    }

    private func setupArr() {
        let cloudSettings = settingProvider.getCloudSettings()

        for cloudSetting in cloudSettings {
            let setting: SettingType
            if cloudSetting.type == Bool.self {
                setting = BoolSetting(key: cloudSetting.key, title: cloudSetting.title, value: cloudSetting.value)
            } else if cloudSetting.type == Int.self {
                setting = IntSetting(key: cloudSetting.key, title: cloudSetting.title, value: cloudSetting.value)
            } else {
                fatalError("Unknown type: \(cloudSetting.type)")
            }
            settings.append(setting)
        }
    }

    func saveSettings() {
        for setting in settings {
            if let firebaseSetting = setting as? FirebaseSetting {
                settingRepository.save(firebaseSetting)
            }
        }
    }
}



