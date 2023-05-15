//
//  PicSizeSetting.swift
//  InterviewApp
//
//  Created by Azizbek Abdulkhakimov on 11/05/23.
//

import Foundation
import SwiftUI

struct PicSizeSetting: View, SettingType {
    var title: String
    @Binding var value: Int

    var body: some View {
        HStack {
            Text(title)
                .fixedSize(horizontal: true, vertical: true)
            Spacer()
            Text("\(value)")
        }
    }
}
