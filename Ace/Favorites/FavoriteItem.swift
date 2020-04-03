//
//  FavoriteItem.swift
//  Ace
//
//  Created by Cher Ma  on 3/8/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import Foundation
import CoreData

import SwiftUI
import UIKit

public class FavoriteItem:NSManagedObject, Identifiable {
    @NSManaged public var link: String?
    @NSManaged public var prepTime: Double
    @NSManaged public var recipeName: String?
    
    func inFavorites(checkLink: String) -> Bool {
        // Get favorites from database
        let request:NSFetchRequest<FavoriteItem> = FavoriteItem.fetchRequest() as!
            NSFetchRequest<FavoriteItem>
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        request.predicate = NSPredicate(format: "link == %@", checkLink)
        
        
        return request.fetchBatchSize != 0
    }
}

extension FavoriteItem {
    static func getAllFavoriteItems(sortBy: String) -> NSFetchRequest<FavoriteItem> {
        // Get favorites from database
        let request:NSFetchRequest<FavoriteItem> = FavoriteItem.fetchRequest() as!
            NSFetchRequest<FavoriteItem>

        // Sort list of recipes by sortBy added
        let sortDescriptor = NSSortDescriptor(key: sortBy, ascending: true)
        request.sortDescriptors = [sortDescriptor]

        return request
    }
    
    
//
//    static func deleteFromFavorites(type: String) -> NSFetchRequest<FavoriteItem> {
//        // Get favorites from database
//        let request:NSFetchRequest<FavoriteItem> = FavoriteItem.fetchRequest() as!
//            NSFetchRequest<FavoriteItem>
//
//        // Sort list of ingredients by time added
//        let sortDescriptor = NSSortDescriptor(key: type, ascending: true)
//        request.sortDescriptors = [sortDescriptor]
//
//        return request
//    }
}

