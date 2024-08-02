//
//  OnboardingViewModel.swift
//  test-for-Healthy-Habits Public
//
//  Created by Dmitrii Imaev on 02.08.2024.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    @Published var currentPage = 0
    
    func nextPage() {
        if currentPage < 2 {
            currentPage += 1
        } else {
            UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
        }
    }
}
