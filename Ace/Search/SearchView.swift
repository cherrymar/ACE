//
//  SearchView.swift
//  Ace
//
//  Created by Cher Ma  on 2/29/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI
//import UIKit


struct SearchView: View {
    let restCaller = RestCaller()
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: IngredientItem.getAllIngredientItems()) var ingredientItems:FetchedResults<IngredientItem>
    
    @State private var newIngredientItem = ""
    @State private var expirationDate = Date();
    
    var body: some View {
        NavigationView {
            List {
                // Section 1- Add ingredients
                Section(header: Text("Add Ingredients")) {
                    // Create a horizontally stacked view (text field and add button)
                    HStack (spacing: 20){
                        // New ingredient text field
                        VStack {
                            TextField("New ingredient", text: self.$newIngredientItem)
                            DropDown()
                            Text("Set Expiration Date")
                            DatePicker("", selection: $expirationDate, in: Date()..., displayedComponents:.date).labelsHidden()
                        }
                        
                        
                        Button(action: {
                            let ingredientItem = IngredientItem( context: self.managedObjectContext)
                            //doesnt work because of async
                            
                            ingredientItem.ingredient = ""
                            ingredientItem.createdAt = Date()
                            ingredientItem.expiresOn = self.expirationDate
                            self.restCaller.getFood(foodId: self.newIngredientItem, ingredientItem: ingredientItem)
                            
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
                // Section 2- Display ingredients
                Section(header: Text("Ingredients")) {
                    // Display each ingredient in database
                    ForEach(self.ingredientItems) { ingredItem in
                        // Display ingredient name and time added
                        //ingredItem.ingredient=""
                        IngredientItemView(ingredient: ingredItem.ingredient!, createdAt: "\(ingredItem.createdAt!)", expiresOn: "\(ingredItem.expiresOn!)")
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct DropDown: View {
    @State var expand = false
    var body: some View {
        VStack() {
            VStack(spacing: 30) {
                HStack {
                    Text("Menu").fontWeight(.bold)
                    Image(systemName: "chevron.up").resizable().frame(width: 13, height: 6)
                }
            }
        }
    }
}
