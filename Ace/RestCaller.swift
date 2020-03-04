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
            }
        }
        return foodInfo
    }
}
