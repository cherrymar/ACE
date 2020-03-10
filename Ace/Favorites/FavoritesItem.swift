//
//  FavoritesItem.swift
//  Ace
//
//  Created by Cher Ma  on 3/8/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import Foundation
import CoreData

public class FavoriteItem:NSManagedObject, Identifiable {
    @NSManaged public var link: String?
}

extension FavoriteItem {
    static func getAllFavoriteItems() -> NSFetchRequest<RecipeItem> {
        // Get favorites from database
        let request:NSFetchRequest<RecipeItem> = RecipeItem.fetchRequest() as!
            NSFetchRequest<RecipeItem>

        // Sort list of ingredients by time added
        let sortDescriptor = NSSortDescriptor(key: "link", ascending: true)
        request.sortDescriptors = [sortDescriptor]

        return request
    }
    
    static func deleteFromFav(link: String) -> NSFetchRequest<RecipeItem>{
        // Get favorites from database
        let request:NSFetchRequest<RecipeItem> = RecipeItem.fetchRequest() as!
            NSFetchRequest<RecipeItem>

        // Sort list of ingredients by time added
        let sortDescriptor = NSSortDescriptor(key: "link", ascending: true)
        request.sortDescriptors = [sortDescriptor]

        return request
//        let items = list.mutableSetValue(forKey: "items")
//
//        if let anyItem = items.anyObject() as? NSManagedObject {
//            managedObjectContext.delete(link)
    }
//        @FetchRequest(fetchRequest: IngredientItem.getAllIngredientItems()) var ingredientItems:FetchedResults<IngredientItem>
        
        
}

