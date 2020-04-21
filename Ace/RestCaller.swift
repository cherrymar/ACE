//
//  RestCaller.swift
//  Ace
//
//  Created by zoomClinic1920 on 3/3/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

class RestCaller {
    let rest = RestManager()
    var apiKey = ""
    //"RH3s29lFBdgsmpyxvQAwGJz60Ec71bxVlgjUBfRX"
    init() {
        self.apiKey = ""
    }
    func setKey(newKey: String) {
        apiKey = newKey
    }
    func searchFood(foodName: String, candidateContainer: CandidateContainer) {
        //apiKey = profiles.first!.api_key ?? "no key";
        let baseUrl = "https://api.nal.usda.gov/fdc/v1/search"
        let fullUrl = baseUrl + "?api_key=" + apiKey// + "\\&generalSearchInput="
            
        var fixedUrl = fullUrl + foodName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        print(fullUrl)
        guard let url = URL(string: fullUrl) else {return}
        rest.requestHttpHeaders.add(value: "application/json", forKey: "Content-Type")
        rest.httpBodyParameters.add(value: foodName, forKey: "generalSearchInput")
        rest.makeRequest(toURL: url, withHttpMethod: .post) { (results) in
            if let data = results.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let userData = try? decoder.decode(FoodSearch.self, from: data) else { return }
                candidateContainer.setCandidates(newCandidates: userData.foods!)
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
        rest.httpBodyParameters = RestManager.RestEntity()
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
    }
}
