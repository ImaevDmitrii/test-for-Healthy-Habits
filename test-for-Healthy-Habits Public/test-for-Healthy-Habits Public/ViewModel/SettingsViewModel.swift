//
//  SettingsViewModel.swift
//  test-for-Healthy-Habits Public
//
//  Created by Dmitrii Imaev on 02.08.2024.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    @Published var userSettings = UserSettings()
}
