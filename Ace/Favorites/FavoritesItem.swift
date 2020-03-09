////
////  FavoritesItem.swift
////  Ace
////
////  Created by Cher Ma  on 3/8/20.
////  Copyright © 2020 Cher Ma . All rights reserved.
////
//
//import Foundation
//import CoreData
//
//public class FavoriteItem:NSManagedObject, Identifiable {
//    @NSManaged public var dateAdded: Date?
//    @NSManaged public var recipe: NSSet?
//
//    public var wrappedDateAdded: Date {
//        dateAdded ?? Date()
//    }
//
//    public var recipeArray: [RecipeItem] {
//        let set = recipe as? Set<RecipeItem> ?? []
//
//        return set.sorted {
//            $0.wrappedName < $1.wrappedName
//        }
//    }
//}
//
//extension FavoriteItem {
//    @objc(addRecipeObject:)
//    @NSManaged public func addToRecipe(_ value: RecipeItem)
//
//    @objc(removeRecipeObject:)
//    @NSManaged public func removeFromRecipe(_ value: RecipeItem)
//
//    @objc(addRecipe:)
//    @NSManaged public func addToRecipe(_ values: NSSet)
//
//    @objc(removeRecipe:)
//    @NSManaged public func removeFromRecipe(_ values: NSSet)
//
//    static func getAllFavoriteItems() -> NSFetchRequest<FavoriteItem> {
//        // Get ingredients from database
//        let request:NSFetchRequest<FavoriteItem> = FavoriteItem.fetchRequest() as!
//            NSFetchRequest<FavoriteItem>
//
//        // Sort list of ingredients by time added
//        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
//        request.sortDescriptors = [sortDescriptor]
//
//        return request
//    }
//}
