//
//  seeker_sneakerApp.swift
//  seeker-sneaker
//
//  Created by Wilson Chung on 2/17/21.
//

import Firebase
import FirebaseFirestore
import UIKit
import SwiftUI

// Set up AppDelegate to configure Google Firebase
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}


@main
struct seeker_sneakerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            
            ContentView()
        }
    }
}


