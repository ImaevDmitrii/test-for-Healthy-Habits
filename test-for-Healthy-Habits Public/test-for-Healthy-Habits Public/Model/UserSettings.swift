//
//  UserSettings.swift
//  test-for-Healthy-Habits Public
//
//  Created by Dmitrii Imaev on 02.08.2024.
//

import SwiftUI

final class UserSettings: ObservableObject {
    @Published var selectedCategory: Category = .love {
        didSet {
            saveCategory()
            NotificationCenter.default.post(name: .settingsDidChange, object: nil)
        }
    }
    @Published var selectedBackgroundColor: BackgroundColor = .blue {
        didSet {
            saveBackgroundColor()
            NotificationCenter.default.post(name: .settingsDidChange, object: nil)
        }
    }
    @Published var selectedGender: Gender = .male {
        didSet {
            saveGender()
            NotificationCenter.default.post(name: .settingsDidChange, object: nil)
        }
    }
    @Published var selectedLanguage: Language = .english{
        didSet {
            saveLanguage()
            NotificationCenter.default.post(name: .settingsDidChange, object: nil)
        }
    }
    
    init() {
        let savedLanguage = UserDefaults.standard.string(forKey: "language")?.lowercased() ?? "en"
        selectedLanguage = Language(rawValue: savedLanguage) ?? .english
        let savedGender = UserDefaults.standard.string(forKey: "gender")?.lowercased() ?? "male"
        selectedGender = Gender(rawValue: savedGender) ?? .male
        let savedCategory = UserDefaults.standard.string(forKey: "selectedCategory")?.lowercased() ?? "love"
        selectedCategory = Category(rawValue: savedCategory) ?? .love
        let savedBackgroundColor = UserDefaults.standard.string(forKey: "selectedBackgroundColor")?.lowercased() ?? "blue"
        selectedBackgroundColor = BackgroundColor(rawValue: savedBackgroundColor) ?? .blue
    }
    
    enum BackgroundColor: String, CaseIterable {
        case blue
        case red
        
        var color: UIColor {
            switch self {
            case .blue:
                return .softBlue
            case .red:
                return .softRed
            }
        }
        
        var localized: String {
            switch self {
            case .blue:
                return LocalizedStrings.blue
            case .red:
                return LocalizedStrings.red
            }
        }
    }
    
    enum Gender: String, CaseIterable {
        case male
        case female
        
        var localized: String {
            switch self {
            case .male:
                return LocalizedStrings.male
            case .female:
                return LocalizedStrings.female
            }
        }
    }
    
    enum Language: String, CaseIterable {
        case english = "en"
        case russian = "ru"
        
        var displayName: String {
            switch self {
            case .english:
                return LocalizedStrings.english
            case .russian:
                return LocalizedStrings.russian
            }
        }
    }
    
    enum Category: String, CaseIterable {
        case love
        case friendship
        
        var localized: String {
            switch self {
            case .love:
                return LocalizedStrings.love
            case .friendship:
                return LocalizedStrings.friendship
            }
        }
    }
    
    private func saveLanguage() {
        UserDefaults.standard.set(selectedLanguage.rawValue, forKey: "language")
    }
    
    private func saveGender() {
        UserDefaults.standard.set(selectedGender.rawValue, forKey: "gender")
    }
    
    private func saveCategory() {
        UserDefaults.standard.set(selectedCategory.rawValue, forKey: "selectedCategory")
    }
    
    private func saveBackgroundColor() {
        UserDefaults.standard.set(selectedBackgroundColor.rawValue, forKey: "selectedBackgroundColor")
    }
}

extension Notification.Name {
    static let settingsDidChange = Notification.Name("settingsDidChange")
}
