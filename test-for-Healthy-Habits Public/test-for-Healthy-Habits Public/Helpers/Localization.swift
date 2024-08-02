//
//  Localization.swift
//  test-for-Healthy-Habits Public
//
//  Created by Dmitrii Imaev on 02.08.2024.
//

import Foundation

struct LocalizedStrings {
    static var chooseCategory: String { "choose_category".localized }
    static var chooseBackgroundColor: String { "choose_background_color".localized }
    static var chooseGender: String { "choose_gender".localized }
    static var settings: String { "settings".localized }
    static var category: String { "category".localized }
    static var backgroundColor: String { "background_color".localized }
    static var gender: String { "gender".localized }
    static var language: String { "language".localized }
    static var changeLanguage: String { "change_language".localized }
    static var noAffirmationsAvailable: String { "no_affirmations_available".localized }
    static var blue: String { "blue".localized }
    static var red: String { "red".localized }
    static var male: String { "male".localized }
    static var female: String { "female".localized }
    static var english: String { "english".localized }
    static var russian: String { "russian".localized }
    static var doneButton: String { "done".localized }
    static var love: String { "love".localized }
    static var friendship: String { "friendship".localized }
}

extension String {
    var localized: String {
        let lang = UserDefaults.standard.string(forKey: "language") ?? "en"
        guard let path = Bundle.main.path(forResource: lang, ofType: "lproj"),
              let bundle = Bundle(path: path) else { return self }
        let localizedString = NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
        return localizedString
    }
}
