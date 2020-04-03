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
    
    var recipeItems = RecipeItem.getAllRecipeItems(sortBy: "link")
    
    var body: some View {
        
        HStack {
            List {
                ForEach(self.recipeItems) { recipeItem in
                    RecipeItemView(recipeName: recipeItem.recipeName!, link: recipeItem.link!, prepTime: "\(recipeItem.prepTime)")
                }
            }
        }
    }
}

struct AutoRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AutoRecipeView()
    }
}
