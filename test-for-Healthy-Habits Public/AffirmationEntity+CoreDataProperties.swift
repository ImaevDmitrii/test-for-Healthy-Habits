//
//  AffirmationEntity+CoreDataProperties.swift
//  test-for-Healthy-Habits Public
//
//  Created by Dmitrii Imaev on 02.08.2024.
//
//

import Foundation
import CoreData


extension AffirmationEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AffirmationEntity> {
        return NSFetchRequest<AffirmationEntity>(entityName: "AffirmationEntity")
    }

    @NSManaged public var gender: String?
    @NSManaged public var text: String?
    @NSManaged public var category: String?
    @NSManaged public var language: String?

}

extension AffirmationEntity : Identifiable {

}
