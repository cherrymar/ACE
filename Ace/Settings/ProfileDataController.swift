//
//  ProfileData.swift
//  Ace
//
//  Created by alvin on 4/14/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import Foundation
import CoreData
 
class ProfileDataController {
    private static let controller = ProfileDataController()
    static func getController() -> ProfileDataController{
        return controller
    }
    let persistentContainer = NSPersistentContainer(name: "LibraryDataModel")
    
    func initalizeStack() {
        self.persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                print("could not load store \(error.localizedDescription)")
                return
            }
            print("store loaded")
        }
    }
    
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    func fetchProfiles() throws -> [Profile] {
        let profiles = try self.context.fetch(Profile.fetchRequest() as NSFetchRequest<Profile>)
        return profiles
    }
    
    func fetchProfile() throws -> Profile {
        var profile:Profile
        do {
            try profile = fetchProfiles()[0]
        } catch {
            try createProfile()
            return try fetchProfile()
        }
        return profile
    }
    
    func update(profile: Profile? = nil, name: String? = nil, email: String? = nil, api_key: String? = nil) throws {
        if (profile == nil) {
            return
        }
        if (name != nil) {
            profile!.name = name
        }
        if (email != nil) {
            profile!.email = email
        }
        if (api_key != nil) {
            profile!.api_key = api_key
        }
        try self.context.save()
    }
    
    func createProfile(name: String? = nil, email: String? = nil, api_key: String? = nil) throws {
        let profile = Profile(context: self.context)
        profile.name = name
        profile.email = email
        profile.api_key = api_key
        self.context.insert(profile)
        try self.context.save()
    }
    
}
