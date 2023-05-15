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
    var value: Any { get set }
    var type: Any { get }
}
