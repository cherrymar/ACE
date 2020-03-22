//
//  FavoritesView.swift
//  Ace
//
//  Created by Cher Ma  on 2/29/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: FavoriteItem.getAllFavoriteItems(sortBy: "link")) var favoriteItems:FetchedResults<FavoriteItem>
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.favoriteItems) { favoriteItem in
                    // Display ingredient name and time added
                    FavoriteItemView(recipeName: favoriteItem.recipeName!, link: favoriteItem.link!, prepTime: "\(favoriteItem.prepTime)")
                }.onDelete{indexSet in
                    // Delete ingredients
                    let deleteItem = self.favoriteItems[indexSet.first!]
                    self.managedObjectContext.delete(deleteItem)
                    
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        print(error)
                    }
                }
                
            }
            
        }.navigationBarTitle(Text("Recipes"))
    }
    
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}


// display recipes that have been saved
