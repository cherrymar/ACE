//
//  RecipeViewController.swift
//  Ace
//
//  Created by Cher Ma  on 3/31/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//


// API Key: c41c80eb790a4bf9af34ff6be705c450
import Foundation
import UIKit

class RecipeViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        return cell
    }
}


extension RecipeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        <#code#>
    }
}
