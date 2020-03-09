//
//  ContentView.swift
//  Ace
//
//  Created by Cher Ma  on 2/18/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI
//var HomeView = HomeView()

struct ContentView: View {
    
    init() {
        // Chang tab bar color
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = UIColor(named: "softRed")
//        UITabBar.appearance().
    }
    
    @State var selected = 3
    
    var body: some View {
        TabView(selection: $selected) {
            // Home Tab
            HomeView().tabItem({
                Image(Constants.TabBarImageName.tabBar0)
                    .font(.title)
                Text("\(Constants.TabBarText.tabBar0)")
            }).tag(0)
            // Search Ingredients Tab
            SearchView().tabItem({
                Image(Constants.TabBarImageName.tabBar1)
                    .font(.title)
                Text("\(Constants.TabBarText.tabBar1)")
            }).tag(1)
            // Favorites Tab
            FavoritesView().tabItem({
                Image(Constants.TabBarImageName.tabBar2)
                    .font(.title)
                Text("\(Constants.TabBarText.tabBar2)")
            }).tag(2)
            // Settings Tab
            SettingsView().tabItem({
                Image(Constants.TabBarImageName.tabBar3)
                    .font(.title)
                Text("\(Constants.TabBarText.tabBar3)")
            }).tag(3)
        }.accentColor(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
