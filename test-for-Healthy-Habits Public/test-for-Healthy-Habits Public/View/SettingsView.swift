//
//  SettingsView.swift
//  test-for-Healthy-Habits Public
//
//  Created by Dmitrii Imaev on 02.08.2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        Form {
            Section(header: Text(LocalizedStrings.category)) {
                Picker(LocalizedStrings.category, selection: $userSettings.selectedCategory) {
                    ForEach(UserSettings.Category.allCases, id: \.self) { category in
                        Text(category.localized).tag(category)
                    }
                }
            }
            
            Section(header: Text(LocalizedStrings.backgroundColor)) {
                Picker(LocalizedStrings.backgroundColor, selection: $userSettings.selectedBackgroundColor) {
                    ForEach(UserSettings.BackgroundColor.allCases, id: \.self) { color in
                        Text(color.localized).tag(color)
                    }
                }
            }
            
            Section(header: Text(LocalizedStrings.gender)) {
                Picker(LocalizedStrings.gender, selection: $userSettings.selectedGender) {
                    ForEach(UserSettings.Gender.allCases, id: \.self) { gender in
                        Text(gender.localized).tag(gender)
                    }
                }
            }
            
            Section(header: Text(LocalizedStrings.language)) {
                Picker(LocalizedStrings.language, selection: $userSettings.selectedLanguage) {
                    ForEach(UserSettings.Language.allCases, id: \.self) { language in
                        Text(language.displayName).tag(language)
                    }
                }
            }
        }
        .navigationTitle(LocalizedStrings.settings)
        .onDisappear {
            NotificationCenter.default.post(name: .settingsDidChange, object: nil)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(UserSettings())
    }
}
