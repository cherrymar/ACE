//
//  IngredientItem+CoreDataProperties.swift
//  Ace
//
//  Created by Cher Ma  on 3/8/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//
//

import Foundation
import CoreData


extension IngredientItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<IngredientItem> {
        return NSFetchRequest<IngredientItem>(entityName: "IngredientItem")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var ingredient: String?
    @NSManaged public var expiresOn: Date?

}
