//
//  AutoRecipeView.swift
//  Ace
//
//  Created by Cher Ma  on 3/8/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI

struct AutoRecipeView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: FavoriteItem.getAllFavoriteItems(sortBy: "link")) var favoriteItems:FetchedResults<FavoriteItem>
    @FetchRequest(entity: Recipe.entity(), sortDescriptors: []) var recipes: FetchedResults<Recipe>
    
    // Get all recipes
    var recipeItems = RecipeItem.getAllRecipeItems(sortBy: "link")
    
    // Display
    var body: some View {
        HStack {
            List (recipes, id: \.self){ recipe in
                Button(action: {
                    self.make(recipe: recipe)
                }) {
                    Text(recipe.name ?? "default recipe name")
                    
                }
            }
        }
    }
    
    func make(recipe: Recipe) {
        let ingredientList: [(String, Double)] = []//recipe.ingredients.
        let ingredientRequest = IngredientItem.fetchRequest();
        for (ingredientName, amount) in ingredientList {
            ingredientRequest.predicate = NSPredicate (format: "name==@", ingredientName)
            //ingredientRequest.fetchLimi
        }
        
    }
}

struct AutoRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AutoRecipeView()
    }
}
