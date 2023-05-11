//
//  Setting.swift
//  InterviewApp
//
//  Created by Azizbek Abdulkhakimov on 10/05/23.
//

import Foundation
import SwiftUI

protocol SettingType {
    var title: String { get }
    var value: Bool { get set }
    func uiElement() -> AnyView
}

extension SettingType {
    func uiElement() -> AnyView {
        return AnyView(self.makeUIElement())
    }
    
    @ViewBuilder
    private func makeUIElement() -> some View {
        fatalError("Error while conforming")
    }
}
