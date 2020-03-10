//
//  FavoritesView.swift
//  Ace
//
//  Created by Cher Ma  on 2/29/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: FavoriteItem.getAllFavoriteItems()) var favoriteItems:FetchedResults<RecipeItem>
    
    
    var body: some View {
        NavigationView {
            List {
                // Display each recipe in favorites
                ForEach(self.favoriteItems) { favoriteItem in
                    // Display recipe name and time added
                    RecipeItemView(recipeName: favoriteItem.recipeName!, link: favoriteItem.link!, prepTime: "\(favoriteItem.prepTime)")
                    
                    Button(action: {
                    }) {
                        Image(systemName: "heart")
                            // bug here???
                            .foregroundColor(.green)
                            .imageScale(.large)
                    }
                    
                    
                }.onDelete{indexSet in
                    // Delete ingredients
                    
                    let deleteItem = self.favoriteItems[indexSet.first!]
//                        FavoriteItem.deleteFromFav(deleteItem.link)
                }
                
            }
            
        }.navigationBarTitle(Text("Recipes"))
    }
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}


// display recipes that have been saved
