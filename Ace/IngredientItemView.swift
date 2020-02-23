//
//  IngredientItemView.swift
//  Ace
//
//  Created by Cher Ma  on 2/23/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI

struct IngredientItemView: View {
    
    var ingredient:String = ""
    var createdAt:String = ""
    
    var body: some View {
        // Note highlighted properly???
        HStack {
            VStack(alignment: .leading) {
                Text(ingredient).font(.headline)
                Text(createdAt).font(.caption)
            }
        }
    }
}


struct IngredientItemView_Preview: PreviewProvider {
    static var previews: some View {
        IngredientItemView(ingredient: "ingredient", createdAt: "date added")
    }
}
