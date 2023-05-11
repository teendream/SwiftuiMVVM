//
//  ContentView.swift
//  InterviewApp
//
//  Created by Azizbek Abdulkhakimov on 10/05/23.
//

import SwiftUI

struct SettingView: View {
    @StateObject private var viewModel: SettingViewModel

    init() {
        let settingProvider = SettingProvider()
        let settingRepository = SettingsRepository()
        self._viewModel = StateObject(wrappedValue: SettingViewModel(settingProvider: settingProvider, settingsRepository: settingRepository))
    }

    var body: some View {
        VStack {
            ForEach(viewModel.settings, id: \.title) { setting in
                setting.uiElement()
                    .padding()
                    .overlay(Divider())
            }
        }
        Button("Save Settings") {
            viewModel.saveSettings()
        }
    }
}

