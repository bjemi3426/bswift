//
//  NotificationManager.swift
//  SmartyPlants
//
//  Created by Bjem on 7/16/25.
//

import Foundation
import SwiftUI
import UserNotifications

class NotificationManager {
    static func scheduleWateringNotification(for plantName: Plant, at date: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Water Reminder 🌿"
        content.body = "Time to water \(plantName.showName)!"
        content.sound = .default

        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)

        let identifier = "water-\(plantName.showName)-\(Int(date.timeIntervalSince1970))"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to schedule notification: \(error)")
            } else {
                print("Scheduled watering notification for \(plantName.showName) at \(date)")
            }
        }
    }
}




