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
        UITabBar.appearance().backgroundColor = UIColor.purple
    }
    
    @State var selected = 3
    
    var body: some View {
        TabView(selection: $selected) {
            HomeView().tabItem({
                Image(systemName: Constants.TabBarImageName.tabBar0)
                    .font(.title)
                Text("\(Constants.TabBarText.tabBar0)")
            }).tag(0)
            
            SearchView().tabItem({
                Image(systemName: Constants.TabBarImageName.tabBar1)
                    .font(.title)
                Text("\(Constants.TabBarText.tabBar1)")
            }).tag(1)
            
            FavoritesView().tabItem({
                Image(systemName: Constants.TabBarImageName.tabBar2)
                    .font(.title)
                Text("\(Constants.TabBarText.tabBar2)")
            }).tag(2)
            
            SettingsView().tabItem({
                Image(systemName: Constants.TabBarImageName.tabBar3)
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
