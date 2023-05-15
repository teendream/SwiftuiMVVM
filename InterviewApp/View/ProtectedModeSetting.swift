//
//  ProtectedModeSetting.swift
//  InterviewApp
//
//  Created by Azizbek Abdulkhakimov on 10/05/23.
//

import Foundation
import SwiftUI

struct ProtectedModeSetting: View, SettingType {
    var title: String
    @Binding var value: Bool

    var body: some View {
        HStack {
            Text(title)
                .fixedSize(horizontal: true, vertical: true)
            Spacer()
            Toggle(isOn: $value) {
                EmptyView()
            }
        }
    }
}
