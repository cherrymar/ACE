//
//  HomeView.swift
//  Ace
//
//  Created by Cher Ma  on 2/29/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        NavigationView {
            VStack {
                // Logo goes here
                Image("Emily")
                    .resizable()
    //                .clipShape(Circle())
    //                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                    .frame(width: 250, height: 250)
                    .clipped()
                    
                
                // Buttons to generate recipe
                NavigationLink(destination: AutoRecipeView() ) {
                    Text("Generate a recipe")
                }.buttonStyle(NavigationButtonStyle())
                NavigationLink(destination: SearchForRecipeView() ) {
                    Text("Search for a recipe")
                }.buttonStyle(NavigationButtonStyle())
                
                
                Button(action: {
                    let recipeItem1 = RecipeItem( context: self.managedObjectContext)
                    recipeItem1.recipeName = "test 1"
                    recipeItem1.link = "www.google.com"
                    recipeItem1.prepTime = 10
                    
                    let recipeItem2 = RecipeItem( context: self.managedObjectContext)
                    recipeItem2.recipeName = "test 2"
                    recipeItem2.link = "www.google.com"
                    recipeItem2.prepTime = 11
                    
                    let recipeItem3 = RecipeItem( context: self.managedObjectContext)
                    recipeItem3.recipeName = "test 3"
                    recipeItem3.link = "www.google.com"
                    recipeItem3.prepTime = 12
                    
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        print(error)
                    }
                    
                }) {
                    Text("Add")
                        .foregroundColor(.black)
                }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct NavigationButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color("softRed"))
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .font(.custom("Helvetica Neue", size: 18))
//            .background(LinearGradient(gradient: Gradient(colors: [Color(.red), Color(.black)]), startPoint: .leading, endPoint: .trailing))
    }
}
