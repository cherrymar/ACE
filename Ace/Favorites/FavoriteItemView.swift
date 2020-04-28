//
//  FavoriteItemView.swift
//  Ace
//
//  Created by Cher Ma  on 3/8/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//


import SwiftUI

struct FavoriteItemView: View {
    
    var recipeName:String = ""
    var link:String = ""
    var prepTime:String = ""
    
    var body: some View {
        // Create a horizontally stacked view of items
//        HStack {
//            RecipeItemView(recipeName: recipeName, link: link, prepTime: prepTime)
        Button(action:{
            
        }){
            VStack(alignment: .leading) {
                HStack {
                    Text(recipeName).font(.headline)
                    Text(link).font(.caption)
                }
                Text(String(prepTime)).font(.caption)
            }
//            Button(action: {
//            }) {
//                Image(systemName: "heart.fill")
//                    // bug here???
//                    .foregroundColor(.red)
//                    .imageScale(.large)
//
//            }
//        }
        }
    }
}


struct FavoriteItemViewView_Preview: PreviewProvider {
    static var previews: some View {
        // How to use IngredientItemView
        FavoriteItemView(recipeName: "recipe name", link: "link", prepTime: "0.0")
    }
}
