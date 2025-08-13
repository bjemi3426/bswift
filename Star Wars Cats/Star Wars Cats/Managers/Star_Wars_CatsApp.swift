//
//  Star_Wars_CatsApp.swift
//  Star Wars Cats
//
//  Created by Brandon Jemison on 12/19/21.
//

import SwiftUI

@main
struct Star_Wars_CatsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Network())
        }
    }
}
