//
//  ContentView.swift
//  Ace
//
//  Created by Cher Ma  on 2/18/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: IngredientItem.getAllIngredientItems()) var ingredientItems:FetchedResults<IngredientItem>
    
    @State private var newIngredientItem = ""
    
    var body: some View {
//        UIToolbar {}
        NavigationView {
            List {
                Section(header: Text("Add Ingredients")) {
                    HStack {
                        TextField("New ingredient", text: self.$newIngredientItem)
                        Button(action: {
                            let ingredientItem = IngredientItem( context: self.managedObjectContext)
                            ingredientItem.ingredient = self.newIngredientItem
                            ingredientItem.createdAt = Date()
                            
                            // Save ingredient to database
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                print(error)
                            }
                            
                            // Reset text field for new ingredient
                            self.newIngredientItem = ""
                        }) {
                            Image(systemName: "plus.circle.fill")
                                // bug here???
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                
                Section(header: Text("Ingredients")) {
                    // Display ingredients in database
                    ForEach(self.ingredientItems) { ingredItem in
                        IngredientItemView(ingredient: ingredItem.ingredient!, createdAt: "\(ingredItem.createdAt!)")
                    }.onDelete{indexSet in
                        // Delete ingredients
                        let deleteItem = self.ingredientItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("My Ingredients"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
