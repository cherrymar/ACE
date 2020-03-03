//
//  ViewController.swift
//  RestManager
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let rest = RestManager()
    let apiKey = "RH3s29lFBdgsmpyxvQAwGJz60Ec71bxVlgjUBfRX"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getUsersList()
        getFood()
    }
    
    
    func getFood() {
        let baseUrl = "https://api.nal.usda.gov/fdc/v1/"
        let foodId = "747447"
        let fullUrl = baseUrl + foodId + "?api_key=" + apiKey
        guard let url = URL(string: fullUrl) else { return }
        
        rest.requestHttpHeaders.add(value: "application/json", forKey: "Content-Type")
        rest.makeRequest(toURL: url, withHttpMethod: .get) { (results) in
            if let data = results.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let userData = try? decoder.decode(FoodData.self, from: data) else { return }
                print(userData.description)
            }
        }
    }
    
}
