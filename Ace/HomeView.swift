//
//  HomeView.swift
//  Ace
//
//  Created by Cher Ma  on 2/29/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI


struct HomeView: View {
    let image = UIImage(named: "Emily") // UIImage?
    var body: some View {
        VStack {
            Image("Emily")
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


// Image logo
// Button- find recipe
// Changes to recipes page- choose how to filter
// checkmarks for all the things to consider
