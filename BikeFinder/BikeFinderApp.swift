//
//  BikeFinderApp.swift
//  BikeFinder
//
//  Created by Julia Ju on 2023-09-05.
//

import SwiftUI
import FirebaseCore
import GoogleMaps


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    
      GMSServices.provideAPIKey("AIzaSyDGFfeSPf2NzDVaSUK8Ts79wO2OlOaMklk")
    return true
  }
}

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
              .environmentObject(AuthViewModel())

      }
    }
  }
}
