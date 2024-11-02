//
//  My_Doctor_TestApp.swift
//  My Doctor Test
//
//  Created by Dmitry Dorodniy on 28.10.2024.
//

import SwiftUI

@main
struct My_Doctor_TestApp: App {
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              PersistenceController.shared.viewContext)
        }
    }
}
