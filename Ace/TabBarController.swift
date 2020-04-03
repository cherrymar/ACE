////
////  ViewController.swift
////  Ace
////
////  Created by Cher Ma  on 2/18/20.
////  Copyright © 2020 Cher Ma . All rights reserved.
////
//
//import UIKit
//
//class TabBarController: UITabBarController {
//    @IBOutlet weak var foodDisplay: UITextView!
//    @IBOutlet weak var foodInput: UITextField!
//    var restCaller = RestCaller()
//    //@IBOutlet weak var fetchData: UIButton!
//    
//    
//    @IBAction func enterTapped(_ sender: Any) {
//        foodDisplay.text = restCaller.getFood(foodId: foodInput.text!)
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        //foodDisplay.delegate = self
//        foodInput.delegate = self
//    }
//}
//
//extension TabBarController : UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//}
