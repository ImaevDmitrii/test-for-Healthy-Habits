//
//  test_for_Healthy_Habits_PublicApp.swift
//  test-for-Healthy-Habits Public
//
//  Created by Dmitrii Imaev on 02.08.2024.
//

import SwiftUI

@main
struct test_for_Healthy_Habits_PublicApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var userSettings = UserSettings()
    
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                MainView(viewContext: persistenceController.container.viewContext, userSettings: userSettings)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(userSettings)
            } else {
                OnboardingView(hasCompletedOnboarding: $hasCompletedOnboarding)
                    .environmentObject(userSettings)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
