//
//  RecipeItem.swift
//  Ace
//
//  Created by Cher Ma  on 3/5/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import Foundation
import CoreData


public class RecipeItem:NSManagedObject, Identifiable {
    @NSManaged public var link: String?
    @NSManaged public var prepTime: Double
    @NSManaged public var recipeName: String?
}

extension RecipeItem {
    static func getAllRecipeItems(sortType: String) -> NSFetchRequest<RecipeItem> {
        // Get ingredients from database
        let request:NSFetchRequest<RecipeItem> = RecipeItem.fetchRequest() as!
            NSFetchRequest<RecipeItem>
        
        // Sort list of ingredients by time added
        let sortDescriptor = NSSortDescriptor(key: sortType, ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
