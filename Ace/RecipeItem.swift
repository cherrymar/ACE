//
//  RecipeItem.swift
//  Ace
//
//  Created by Cher Ma  on 3/5/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import Foundation
import CoreData


public class RecipeItem:Identifiable {
    var link: String?
    var prepTime: Double
    var recipeName: String?
    
    init(link: String, prepTime: Double, recipeName: String) {
        self.link = link
        self.prepTime = prepTime
        self.recipeName = recipeName
//        super.init()
    }
}

extension RecipeItem {
    static func getAllRecipeItems(sortBy: String) -> Array<RecipeItem> {
        // Get ingredients from database
        let RecipeItem1 = RecipeItem(link: "appliepie.com", prepTime: 1, recipeName: "Applie Pie")
        let RecipeItem2 = RecipeItem(link: "ccc.com", prepTime: 2, recipeName: "Chocolate Chip Cookies")
        let RecipeItem3 = RecipeItem(link: "macarons.com", prepTime: 3, recipeName: "Macarons")
        
        let request = [RecipeItem1, RecipeItem2, RecipeItem3]
        
        // Sort list of recipes by sortType
        
        return request
    }
}
