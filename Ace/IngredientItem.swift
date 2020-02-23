//
//  IngredientItem.swift
//  Ace
//
//  Created by Cher Ma  on 2/23/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import Foundation
import CoreData

public class IngredientItem:NSManagedObject, Identifiable {
    @NSManaged public var createdAt:Date?
    @NSManaged public var ingredient:String?
}

extension IngredientItem {
    static func getAllIngredientItems() -> NSFetchRequest<IngredientItem> {
        let request:NSFetchRequest<IngredientItem> = IngredientItem.fetchRequest() as!
            NSFetchRequest<IngredientItem>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
