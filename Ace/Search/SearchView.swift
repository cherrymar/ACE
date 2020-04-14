//
//  SearchView.swift
//  Ace
//
//  Created by Cher Ma  on 2/29/20.
//  Copyright © 2020 Cher Ma . All rights reserved.
//

import SwiftUI
import UserNotifications
//import UIKit
    // List of briefFoodData
public class CandidateContainer {
    var maxResults = 5
    var searchCandidates = [briefFoodData]()
    func setCandidates (newCandidates: [briefFoodData]) {
        if newCandidates.count >= maxResults {
            self.searchCandidates = Array(newCandidates[0 ..< maxResults])
        } else {
            self.searchCandidates = newCandidates
        }
        
    }
    func emptyCandidates() {
        self.searchCandidates = [briefFoodData]()
    }
}
var candidateContainer = CandidateContainer()


struct SearchView: View {
    let restCaller = RestCaller()
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: IngredientItem.getAllIngredientItems()) var ingredientItems:FetchedResults<IngredientItem>
    
    @State public var newIngredientItem = ""
    @State private var expirationDate = Date();
    
    // To format the way the date is displayed
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
    
    var body: some View {
        NavigationView {
            List {
                // Section 1- Add ingredients
                Section(header: Text("Add Ingredients")) {
                    // Create a horizontally stacked view (text field and add button)
                    HStack{
                        // New ingredient text field
                        VStack {
                            HStack {
                                TextField("New ingredient", text: self.$newIngredientItem)
                                Button(action: {
                                    self.restCaller.searchFood(foodName: self.newIngredientItem, candidateContainer: candidateContainer)
                                }) {
                                    Image(systemName: "plus.circle.fill").foregroundColor(.green).imageScale(.large)
                                }
                            }
                            
                            DropDown(parent: self)
                            Text("Set Expiration Date")
                            DatePicker("", selection: $expirationDate, in: Date()..., displayedComponents:.date).labelsHidden()
                        }
                        
                    }
                }.font(.headline)
                // Section 2- Display ingredients
                Section(header: Text("Ingredients")) {
                    // Display each ingredient in database
                    ForEach(self.ingredientItems) { ingredItem in
                        // Display ingredient name and time added
                        IngredientItemView(ingredient: ingredItem.ingredient!, createdAt: "Added: \(self.dateFormatter.string(from: ingredItem.createdAt!))", expiresOn: "Expires: \(self.dateFormatter.string(from: ingredItem.expiresOn!))")
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
    
    func addIngredient(ingredientID: String){
        /*while (!self.ingredientItems.isEmpty) {
            self.managedObjectContext.delete(self.ingredientItems[0])
            do {
                try self.managedObjectContext.save()
            } catch {
                print(error)
            }
        }*/
        let ingredientItem = IngredientItem( context: self.managedObjectContext)
        ingredientItem.ingredient = ""
        ingredientItem.createdAt = Date()
        ingredientItem.expiresOn = self.expirationDate
        self.restCaller.getFood(foodId: ingredientID, ingredientItem: ingredientItem)
        
        // Save ingredient to database
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error)
        }
        // Reset text field for new ingredient
        self.newIngredientItem = ""
        
        //Set notification for expiration
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) {
            (granted, error) in
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Hey I'm a notification!"
        content.body = ingredientID
        let date = Date().addingTimeInterval(10)
        
         let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
//        var dateComponents = DateComponents()
//        dateComponents.year = ingredientItem.expiresOn.dateC
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        center.add(request) { (error) in
            //check error parameters
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
    var parent: SearchView?
    var body: some View {
        VStack() {
            HStack {
                Text("Ingredient Search").fontWeight(.bold)
                Image(systemName: expand ? "chevron.up" : "chevron.down").resizable().frame(width: 13, height: 6)
            }.onTapGesture {
                self.expand.toggle()
            }
            if expand {
                VStack(spacing: 30) {
                
                    ForEach(candidateContainer.searchCandidates, id: \.self) {candidate in
                        Button(action: {
                            self.parent?.addIngredient(ingredientID: "\(candidate.fdcId)")
                            self.parent?.newIngredientItem = ""
                            candidateContainer.emptyCandidates()
                            self.expand.toggle()
                            print("tapped\(candidate.fdcId)")
                        }) {
                            Text("\(candidate.description) from \(candidate.brandOwner ?? "anonymous")").fontWeight(.light).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.purple, lineWidth: 2))
                        }.foregroundColor(.orange).accentColor(.blue).border(LinearGradient(gradient: .init(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom), width: 5)
                    }
                    
                }
            }
        }
    }
}
