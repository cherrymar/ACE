//
//  FavoriteItem.swift
//  Ace
//
//  Created by Cher Ma  on 3/8/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import Foundation
import CoreData

public class FavoriteItem:NSManagedObject, Identifiable {
    @NSManaged public var link: String?
    @NSManaged public var prepTime: Double
    @NSManaged public var recipeName: String?
    
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteItem> {
//        return NSFetchRequest<FavoriteItem>(entityName: "link")
//    }
}

extension FavoriteItem {
    static func getAllFavoriteItems(sortBy: String) -> NSFetchRequest<FavoriteItem> {
        // Get favorite items from database
        let request:NSFetchRequest<FavoriteItem> = FavoriteItem.fetchRequest() as!
            NSFetchRequest<FavoriteItem>
        
        // Sort list of favorite items by link
        let sortDescriptor = NSSortDescriptor(key: sortBy, ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
