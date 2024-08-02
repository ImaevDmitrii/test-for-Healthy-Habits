//
//  AffirmationViewModel.swift
//  test-for-Healthy-Habits Public
//
//  Created by Dmitrii Imaev on 02.08.2024.
//

import Foundation
import CoreData

final class AffirmationViewModel: ObservableObject {
    @Published var currentAffirmationIndex = 0
    @Published var affirmations: [Affirmation] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private var viewContext: NSManagedObjectContext
    private var userSettings: UserSettings
    
    init(viewContext: NSManagedObjectContext, userSettings: UserSettings) {
        self.viewContext = viewContext
        self.userSettings = userSettings
        fetchAffirmations()
        NotificationCenter.default.addObserver(self, selector: #selector(settingsDidChange), name: .settingsDidChange, object: nil)
    }
    
    @objc func settingsDidChange() {
        fetchAffirmations()
    }
    
    func fetchAffirmations() {
        isLoading = true
        let request: NSFetchRequest<AffirmationEntity> = AffirmationEntity.fetchRequest()
        
        do {
            let fetchedEntities = try viewContext.fetch(request)
            var fetchedAffirmations = fetchedEntities.map { entity in
                Affirmation(text: entity.text ?? "",
                            category: entity.category?.lowercased() ?? "",
                            language: entity.language?.lowercased() ?? "",
                            gender: entity.gender?.lowercased() ?? "")
            }
            
            let selectedCategory = userSettings.selectedCategory.rawValue.lowercased()
            let selectedLanguage = userSettings.selectedLanguage.rawValue.lowercased()
            let selectedGender = userSettings.selectedGender.rawValue.lowercased()
            
            fetchedAffirmations = fetchedAffirmations.filter { affirmation in
                let matchesCategory = selectedCategory.isEmpty || affirmation.category == selectedCategory
                let matchesLanguage = selectedLanguage.isEmpty || affirmation.language == selectedLanguage
                let matchesGender = selectedGender.isEmpty || affirmation.gender == selectedGender
                
                return matchesCategory && matchesLanguage && matchesGender
            }
            
            self.affirmations = fetchedAffirmations
            
            isLoading = false
        } catch {
            self.error = error
            isLoading = false
        }
    }
    
    func nextAffirmation() {
        if !affirmations.isEmpty {
            currentAffirmationIndex = (currentAffirmationIndex + 1) % affirmations.count
        }
    }
    
    func previousAffirmation() {
        if !affirmations.isEmpty {
            currentAffirmationIndex = (currentAffirmationIndex - 1 + affirmations.count) % affirmations.count
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .settingsDidChange, object: nil)
    }
}
