//
//  FoodStructure.swift
//  RestManager
//
//  Created by zoomClinic1920 on 3/3/20.
//  Copyright © 2020 Appcoda. All rights reserved.
//

import Foundation

var defString = String(stringLiteral: "")
var defInt = -1

struct FoodData: Codable, CustomStringConvertible {
    var desc: String?
    var category: foodCategory?
    var foodClass: String = "no"
    var foodNutrients: String = "no"
    var foodComponents: String = "no"
    var scientificName: String = "no"
    var foodAttributes: String = "no"
    var tableAliasName: String = "no"
    var nutrientConversionFactors: String = "no"
    var isHistoricalReference: String = "no"
    var ndbNumber: String = "no"
    var footnote: String = "no"
    var fdcId: String = "no"
    var dataType: String = "no"
    var publicationDate: String = "no"
    var foodPortions: String = "no"
    var inputFoods: String = "no"
    var foodUpdateLog: String = "no"
    var changes: String = "no"
    
    private enum CodingKeys: String, CodingKey {
        case desc = "description"
        case category = "foodCategory"
    }
    
    var description: String {
        let output = """
        description = \(desc ?? defString)
        category = \(category?.description ?? defString)
        
        """
        
        return output
    }
}

struct foodCategory: Codable {
    var id: Int
    var code: String
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case code = "code"
        case description = "description"
    }
}

