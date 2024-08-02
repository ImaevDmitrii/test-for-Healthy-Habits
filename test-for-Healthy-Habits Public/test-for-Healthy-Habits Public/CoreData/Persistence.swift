//
//  Persistence.swift
//  test-for-Healthy-Habits Public
//
//  Created by Dmitrii Imaev on 02.08.2024.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "test_for_Healthy_Habits_Public")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        if container.viewContext.affirmationsCount == 0 {
            populateAffirmations()
        }
    }
    
    private func populateAffirmations() {
        let context = container.viewContext
        for affirmation in AffirmationData.affirmations {
            let entity = AffirmationEntity(context: context)
            entity.text = affirmation.text
            entity.category = affirmation.category
            entity.language = affirmation.language
            entity.gender = affirmation.gender
        }
    }
    
    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

extension NSManagedObjectContext {
    var affirmationsCount: Int {
        let request: NSFetchRequest<AffirmationEntity> = AffirmationEntity.fetchRequest()
        request.includesSubentities = false
        return (try? count(for: request)) ?? 0
    }
}
