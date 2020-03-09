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
    @FetchRequest(fetchRequest: RecipeItem.getAllRecipeItems(sortType: "link")) var recipeItems:FetchedResults<RecipeItem>
    
//    @State private var newIngredientItem = ""
    //    @State private var expirationDate = Date();
        
    var body: some View {
        NavigationView {
            List {
                // Display recipes found
                // Create a horizontally stacked view (text field and add button)
                HStack {
                    List {
                        // Display each ingredient in database
                        ForEach(self.recipeItems) { recipeItem in
                            // Display ingredient name and time added
                            RecipeItemView(recipeName: recipeItem.recipeName!)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Recipes"))
//            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct SearchForRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SearchForRecipeView()
    }
}
