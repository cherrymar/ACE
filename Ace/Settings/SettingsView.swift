//
//  SettingsView.swift
//  Ace
//
//  Created by Cher Ma  on 2/29/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State var username = ""
    
    var profileController = ProfileDataController.getController();
    
    var body: some View {
        NavigationView {
            List {
                // Section 1- Add ingredients
                Section(header: Text("Profile Settings")) {
                    VStack (alignment: .leading) {
                        Text("Test \(username)")
                        Text("Test email")
                        Text("Test username")
                    }
                }
                .font(.headline)
                Section(header: Text("Search Settings")) {
                    VStack (alignment: .leading) {
                        TextField("Enter username...", text: $username, onEditingChanged: { (changed) in
                            print("Username onEditingChanged - \(changed)")
                        }) {
                            // On Commit
                            do {
                                var profile = try self.profileController.fetchProfile()
                                try self.profileController.update(profile: profile, name:self.username)
                            } catch {
                                print("profile fetching/updating error")
                            }
                        }
                        Text("Test email")
                        Text("Test username")
                    }
                }
                .font(.headline)
                Section(header: Text("Profile")) {
                    VStack (alignment: .leading) {
                        Text("Test username")
                        Text("Test email")
                        Text("Test username")
                    }
                }
                .font(.headline)
            }
        }.navigationBarTitle(Text("My Ingredients"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


// Change login and default options
// Yes/No reminder to help remmeber when to buy more ingredient
