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
    
//    @State private var newFavoriteItem = ""
    
    var body: some View {
        // Create a horizontally stacked view of items
        HStack {
            HStack {
                VStack(alignment: .leading) {
                HStack {
                    Text(recipeName).font(.headline)
                    Text(link).font(.caption)
                }
                Text(String(prepTime)).font(.caption)
                }
            Button(action: {
//                let recipeItem = RecipeItem(context: self.managedObjectContext)
//                recipeItem.favorite =
//                do {
//                    try self.managedObjectContext.save()
//                } catch {
//                    print(error)
//                }
            }) {
                Image("heart_filled")
                    .foregroundColor(.red)
                    .imageScale(.large)
                }
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