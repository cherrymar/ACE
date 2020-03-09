////
////  FavoriteItem+CoreDataProperties.swift
////  Ace
////
////  Created by Cher Ma  on 3/8/20.
////  Copyright © 2020 Cher Ma . All rights reserved.
////
////
//
//import Foundation
//import CoreData
//
//
//extension FavoriteItem {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteItem> {
//        return NSFetchRequest<FavoriteItem>(entityName: "FavoriteItem")
//    }
//
//    @NSManaged public var dateAdded: Date?
//    @NSManaged public var recipe: NSSet?
//
//}
//
//// MARK: Generated accessors for recipe
//extension FavoriteItem {
//
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
//}
