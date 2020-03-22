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
                RecipeItemView(recipeName: "Apple Pie", link: "appliepie.com", prepTime: "2.5")
                RecipeItemView(recipeName: "Chocolate Chip Cookies", link: "ccc.com", prepTime: "0.5")
                RecipeItemView(recipeName: "Macarons", link: "macarons.com", prepTime: "3.0")
                RecipeItemView(recipeName: "Steak", link: "steak.com", prepTime: "1.0")
            }
            
//            List {
//                ForEach(self.recipeItems) { recipeItem in
//                    // Display ingredient name and time added
//                    HStack {
//                        RecipeItemView(recipeName: recipeItem.recipeName!, link: recipeItem.link!, prepTime: "\(recipeItem.prepTime)")
//                        Button(action: {
//                            let favoriteItem = FavoriteItem( context: self.managedObjectContext)
//                            favoriteItem.recipeName = recipeItem.recipeName!
//                            favoriteItem.link = recipeItem.link!
//                            favoriteItem.prepTime = recipeItem.prepTime
//
//                            var liked = (self.favoriteItems.firstIndex(of: favoriteItem) != -1)
//                            do {
//                                if (!liked) {
//                                    try self.managedObjectContext.save()
//                                    liked = !liked
//                                }
//                                else {
//                                    try self.managedObjectContext.save()
//                                }
//                            } catch {
//                                print(error)
//                            }
//                        }) {
//                            Image(systemName: "heart.fill")
//                                // bug here???
//                                .foregroundColor(.red)
//                                .imageScale(.large)
//                        }
//
//                    }
//
//                }
//            }
        }
    }
}

struct AutoRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AutoRecipeView()
    }
}
