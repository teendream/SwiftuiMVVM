//
//  ProtectedModeSetting.swift
//  InterviewApp
//
//  Created by Azizbek Abdulkhakimov on 10/05/23.
//

import Foundation
import SwiftUI

struct ProtectedModeSetting: SettingType {
    var title: String = "Protect Documents from editing"
    @State var value: Bool = false
    
    @ViewBuilder
    private func makeUIElement() -> some View {
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
