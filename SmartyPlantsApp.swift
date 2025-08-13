//
//  SmartyPlantsApp.swift
//  SmartyPlants
//
//  Created by Bjem on 7/15/25.
//

import SwiftUI
import CoreData
import UserNotifications

@main
struct SmartyPlantsApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(PlantViewModel(context: persistenceController.container.viewContext))
                .onAppear {
                    requestNotificationPermissionIfNeeded()
                }
        }
    }
    
    func requestNotificationPermissionIfNeeded() {
          UNUserNotificationCenter.current().getNotificationSettings { settings in
              if settings.authorizationStatus != .authorized {
                  UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
                      if let error = error {
                          print("Access is \(granted)")
                          print("Error requesting notifications: \(error)")
                      }
                  }
              }
          }
      }
}
