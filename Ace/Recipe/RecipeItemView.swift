//
//  RecipeItemView.swift
//  Ace
//
//  Created by Cher Ma  on 3/5/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI

struct RecipeItemView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var recipeName:String = ""
    var link:String = ""
    var prepTime:String = ""
    
    var body: some View {
        // Create a horizontally stacked view of recipes
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(recipeName).font(.headline)
                    Text(link).font(.caption)
                }
                Text(String(prepTime)).font(.caption)
            }
            
            // Buttun to save recipe to favorites
            Button(action: {
                let favorite = FavoriteItem( context: self.managedObjectContext)
                favorite.recipeName = self.recipeName
                favorite.link = self.link
                favorite.prepTime = Double(self.prepTime)!
                
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
            }) {
                Image(systemName: "heart")
                    // bug here???
                    .foregroundColor(.red)
                    .imageScale(.large)
            }
        }
    }
}


struct RecipeItemView_Preview: PreviewProvider {
    static var previews: some View {
        // How to use RecipeItemView
        RecipeItemView(recipeName: "recipe name", link: "link", prepTime: "0.0")
    }
}
