//
//  RecipeIngredients.swift
//  Ace
//
//  Created by binhai on 4/21/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import Foundation

class RecipeIngredients: NSObject, NSCoding {
    var ingredients: [(String, Double)]
    
    enum Keys: String {
        case ingredients = "ingredients"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(ingredients, forKey: "ingredients")
    }

    // Protocol requires an init method which acts as a decoder for our variables based on the Key
    required init?(coder aDecoder: NSCoder) {
        ingredients = aDecoder.decodeObject(forKey: "ingredients") as! [(String, Double)]
        super.init()
    }
}
