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
    @NSManaged public var dateAdded:Date?
}

extension FavoriteItem {
    static func getAllFavoriteItems() -> NSFetchRequest<FavoriteItem> {
        // Get ingredients from database
        let request:NSFetchRequest<FavoriteItem> = FavoriteItem.fetchRequest() as!
            NSFetchRequest<FavoriteItem>
        
        // Sort list of ingredients by time added
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
