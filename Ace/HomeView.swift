//
//  HomeView.swift
//  Ace
//
//  Created by Cher Ma  on 2/29/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI

struct HomeView: View {
//    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    var body: some View {
        VStack {
            Image("Emily")
                .resizable()
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 250, height: 250)
                .clipped()
            // Generate Recipe
            Button(action: {
                //Display new screen
            }) {
                Text("Generate a recipe")
                    .foregroundColor(.black)
            }
            // Search a recipe
            Button(action: {
                //Display new screen
            }) {
                Text("Search a recipe")
                    .foregroundColor(.black)
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


// display recipes that have been saved
