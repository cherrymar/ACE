//
//  SearchForRecipeView.swift
//  Ace
//
//  Created by Cher Ma  on 3/8/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//


import SwiftUI

struct SearchForRecipeView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        HStack {
            List {
                RecipeItemView(recipeName: "Apple Pie", link: "appliepie.com", prepTime: "2.5")
                RecipeItemView(recipeName: "Chocolate Chip Cookies", link: "ccc.com", prepTime: "0.5")
                RecipeItemView(recipeName: "Macarons", link: "macarons.com", prepTime: "3.0")
                RecipeItemView(recipeName: "Steak", link: "steak.com", prepTime: "1.0")
            }
        }
    }
}

struct SearchForRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SearchForRecipeView()
    }
}
