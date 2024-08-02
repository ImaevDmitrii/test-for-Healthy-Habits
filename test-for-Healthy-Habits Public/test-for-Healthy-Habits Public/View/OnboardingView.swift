//
//  OnboardingView.swift
//  test-for-Healthy-Habits Public
//
//  Created by Dmitrii Imaev on 02.08.2024.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var userSettings: UserSettings
    @StateObject private var viewModel = OnboardingViewModel()
    @Binding var hasCompletedOnboarding: Bool
    
    var body: some View {
        ZStack {
            Color(userSettings.selectedBackgroundColor.color)
                .edgesIgnoringSafeArea(.all)
            VStack {
                switch viewModel.currentPage {
                case 0:
                    OnboardingPageView(
                        title: LocalizedStrings.chooseCategory,
                        options: UserSettings.Category.allCases.map { $0.localized }
                    ) { selectedOption in
                        if let selectedCategoryIndex = UserSettings.Category.allCases.firstIndex(where: { $0.localized == selectedOption }) {
                            let selectedCategory = UserSettings.Category.allCases[selectedCategoryIndex]
                            userSettings.selectedCategory = selectedCategory
                            UserDefaults.standard.set(selectedCategory.rawValue, forKey: "selectedCategory")
                            viewModel.nextPage()
                        }
                    }
                case 1:
                    OnboardingPageView(
                        title: LocalizedStrings.chooseBackgroundColor,
                        options: UserSettings.BackgroundColor.allCases.map { $0.localized }
                    ) { selectedOption in
                        if let selectedColorIndex = UserSettings.BackgroundColor.allCases.firstIndex(where: { $0.localized == selectedOption }) {
                            let selectedColor = UserSettings.BackgroundColor.allCases[selectedColorIndex]
                            userSettings.selectedBackgroundColor = selectedColor
                            UserDefaults.standard.set(selectedColor.rawValue, forKey: "selectedBackgroundColor")
                            viewModel.nextPage()
                        }
                    }
                case 2:
                    OnboardingPageView(
                        title: LocalizedStrings.chooseGender,
                        options: UserSettings.Gender.allCases.map { $0.localized }
                    ) { selectedOption in
                        if let selectedGenderIndex = UserSettings.Gender.allCases.firstIndex(where: { $0.localized == selectedOption }) {
                            let selectedGender = UserSettings.Gender.allCases[selectedGenderIndex]
                            userSettings.selectedGender = selectedGender
                            UserDefaults.standard.set(selectedGender.rawValue, forKey: "selectedGender")
                            UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
                            hasCompletedOnboarding = true
                        }
                    }
                default:
                    Text("Onboarding Complete")
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    @State static var hasCompletedOnboarding: Bool = false
    
    static var previews: some View {
        OnboardingView(hasCompletedOnboarding: $hasCompletedOnboarding)
            .environmentObject(UserSettings())
    }
}
