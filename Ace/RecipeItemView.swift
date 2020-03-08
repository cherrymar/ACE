//
//  RecipeItemView.swift
//  Ace
//
//  Created by Cher Ma  on 3/5/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI

struct RecipeItemView: View {
    
    var recipeName:String = ""
    var link:String = ""
    var prepTime:Double = 0.0
    
    var body: some View {
        // Create a horizontally stacked view of items
        HStack {
            VStack(alignment: .leading) {
                Text(recipeName).font(.headline)
                Text(link).font(.caption)
                Text(String(prepTime)).font(.caption)
            }
        }
    }
}


struct RecipeItemView_Preview: PreviewProvider {
    static var previews: some View {
        // How to use IngredientItemView
        RecipeItemView(recipeName: "recipe name", link: "link", prepTime: 0.0)
    }
}
