//
//  IngredientItemView.swift
//  Ace
//
//  Created by Cher Ma  on 2/23/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI

struct IngredientItemView: View {
    
    var ingredient:String = ""
    var createdAt:String = ""
    var expiresOn:String = ""
    
    var body: some View {
        // Create a horizontally stacked view of items
        HStack {
            VStack(alignment: .leading) {
                Text(ingredient).font(.headline)
                Text(createdAt).font(.caption)
                Text(expiresOn).font(.caption)
            }
        }
    }
}


struct IngredientItemView_Preview: PreviewProvider {
    static var previews: some View {
        // How to use IngredientItemView
        IngredientItemView(ingredient: "ingredient", createdAt: "date added", expiresOn: "expires on")
    }
}
