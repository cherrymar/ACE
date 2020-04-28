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
    @State var api_key = ""
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Profile.entity(), sortDescriptors: []) var profiles: FetchedResults<Profile>
    
    
    
    var body: some View {
        NavigationView {
            List {
                // Section 1- Add ingredients
                
                Section(header: Text("Search Settings")) {
                    VStack (alignment: .leading) {
                        TextField("Name: ", text: self.$username) {
                            // On Commit
                            if (self.profiles.count < 1) {
                                self.createProfile();
                            }
                            
                            let profile = self.profiles.first!
                            profile.name = self.$username.wrappedValue
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                // handle the Core Data error
                            }
                        }.foregroundColor(.green).colorScheme(.dark)
                        
                        TextField("Api Key: " + "self.profiles.first!.api_key!", text: self.$api_key) {
                            // On Commit
                            if (self.profiles.count < 1) {
                                self.createProfile();
                            }
                            
                            let profile = self.profiles.first!
                            profile.api_key = self.$api_key.wrappedValue
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                // handle the Core Data error
                            }
                        }.foregroundColor(.green).colorScheme(.dark)
                        
                    }
                }
                .font(.headline)
                Section(header: Text("Profile Settings")) {
                    VStack (alignment: .leading) {
                        Text("Name: " + profiles.first!.name!)
                        Text("Email: " + profiles.first!.email!)
                        Text("Api Key: " + profiles.first!.api_key!)
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
        }.navigationBarTitle(Text("Settings"))
    }
    
    func createProfile() {
        let profile = Profile(context: managedObjectContext);
        profile.name = "";
        profile.email = "";
        profile.api_key = "";
        do {
            try self.managedObjectContext.save()
        } catch {
            // handle the Core Data error
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


// Change login and default options
// Yes/No reminder to help remmeber when to buy more ingredient
