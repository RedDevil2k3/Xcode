//
//  UberCloneApp.swift
//  UberClone
//
//  Created by Abhimanyu Joshi on 7/25/23.
//

import SwiftUI

@main
struct UberCloneApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel) //creates a single global instance of LocationSearchViewModel to be used all within the app
        }
    }
}
