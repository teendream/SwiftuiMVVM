//
//  SettingsRepository.swift
//  InterviewApp
//
//  Created by Azizbek Abdulkhakimov on 10/05/23.
//

import Foundation

class SettingsRepository: BaseFirestoreRepository {

    public func save(_ setting: FirebaseSetting) {
        settingsCollection()
            .document(setting.getKey())
            .setData(setting.dictionary()) { error in
                if (error != nil) {
                    print(error!.localizedDescription)
                    EventHandler.sendEvent(SaveSettingErrorEvent(message: error!.localizedDescription))
                }
            }
    }

    private func settingsCollection() -> CollectionReference {
        return getUserStoreReference()
            .collection(Self.getSettingsPath())
    }
 
}
