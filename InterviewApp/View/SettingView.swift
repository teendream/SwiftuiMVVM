//
//  ContentView.swift
//  InterviewApp
//
//  Created by Azizbek Abdulkhakimov on 10/05/23.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel: SettingViewModel

    init() {
        let settingProvider = SettingProvider()
        let settingRepository = SettingsRepository()
        self._viewModel = StateObject(wrappedValue: SettingViewModel(settingProvider: settingProvider, settingRepository: settingRepository))
    }

    var body: some View {
        VStack {
            ForEach(viewModel.settings, id: \.title) { setting in
                renderSettingView(setting)
                    .padding()
                    .overlay(Divider())
            }
        }
        Button("Save Settings") {
            viewModel.saveSettings() 
        }
    }

    @ViewBuilder
    private func renderSettingView(_ setting: SettingType) -> some View {
        switch setting.type {
        case is Bool.Type:
            if let boolSetting = setting as? ProtectedModeSetting {
                ProtectedModeSetting(title: boolSetting.title, value: binding(for: boolSetting))
            } else {
                EmptyView()
            }
        case is Int.Type:
            if let intSetting = setting as? PicSizeSetting {
                PicSizeSetting(title: intSetting.title, value: binding(for: intSetting))
            } else {
                EmptyView()
            }
        default:
            EmptyView()
        }
    }

    private func binding<T>(for setting: SettingType) -> Binding<T> where T: Equatable {
        Binding<T>(
            get: { () -> T in
                guard let value = setting.value as? T else {
                    fatalError("Invalid value type for setting.")
                }
                return value
            },
            set: { newValue in
                guard let index = viewModel.settings.firstIndex(where: { $0 === setting }) else {
                    return
                }
                viewModel.settings[index].value = newValue
            }
        )
    }
}

