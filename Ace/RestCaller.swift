//
//  RestCaller.swift
//  Ace
//
//  Created by zoomClinic1920 on 3/3/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import Foundation

class RestCaller {
    let rest = RestManager()
    let apiKey = "RH3s29lFBdgsmpyxvQAwGJz60Ec71bxVlgjUBfRX"
    
    func searchFood(foodName: String) {
        let baseUrl = "https://api.nal.usda.gov/fdc/v1/seach"
        let fullUrl = baseUrl + "?api_key=" + apiKey
        guard let url = URL(string: fullUrl) else {return}
        rest.requestHttpHeaders.add(value: "application/json", forKey: "Content-Type")
        rest.httpBodyParameters.add(value: "generalSearchInput", forKey: foodName)
        rest.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
            if let data = results.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let userData = try? decoder.decode(FoodData.self, from: data) else { return }
                
            }
        }
    }
    func getFood(foodId: String) -> String {
        let baseUrl = "https://api.nal.usda.gov/fdc/v1/"

        let fullUrl = baseUrl + foodId + "?api_key=" + apiKey
        var foodInfo = ""
        guard let url = URL(string: fullUrl) else { return defString}
        
        rest.requestHttpHeaders.add(value: "application/json", forKey: "Content-Type")
        rest.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
            if let data = results.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let userData = try? decoder.decode(FoodData.self, from: data) else { return }
                foodInfo = (userData.description)
                print(foodInfo)
            }
        }
        return foodInfo
    }
    
    func getFood(foodId: String, ingredientItem: IngredientItem) {
        let baseUrl = "https://api.nal.usda.gov/fdc/v1/"

        let fullUrl = baseUrl + foodId + "?api_key=" + apiKey
        var foodInfo = ""
        guard let url = URL(string: fullUrl) else { return }
        
        rest.requestHttpHeaders.add(value: "application/json", forKey: "Content-Type")
        rest.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
            if let data = results.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let userData = try? decoder.decode(FoodData.self, from: data) else { return }
                foodInfo = (userData.description)
                ingredientItem.ingredient = foodInfo
                print(foodInfo)
            }
        }
        //ingredientItem.ingredient = foodInfo
    }
}
