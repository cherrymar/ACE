//
//  RecipeIngredients.swift
//  Ace
//
//  Created by binhai on 4/21/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import Foundation

/* Swift doesn't allow storage of specific types beyond primitives/stirngs, so
 * we must use a transformable object via encoding and decoding to store more
 * complex data in coredata.
 */
class RecipeIngredients: NSObject, NSCoding {
    var ingredients: [(String, Double)]
    
    // Key(s) used in methods below
    enum Keys: String {
        case ingredients = "ingredients"
    }
    
    // Puts components into specific keys, can retrieve it by name later.
    func encode(with aCoder: NSCoder) {
        aCoder.encode(ingredients, forKey: "ingredients")
    }

    // Protocol requires an init method which acts as a decoder for our variables based on the Key
    required init?(coder aDecoder: NSCoder) {
        ingredients = aDecoder.decodeObject(forKey: "ingredients") as! [(String, Double)]
        super.init()
    }
}
