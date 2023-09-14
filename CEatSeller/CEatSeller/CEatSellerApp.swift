//
//  CEatSellerApp.swift
//  CEatSeller
//
//  Created by 박범수 on 2023/09/06.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UITabBar.appearance().backgroundColor = .systemBackground
        UITabBar.appearance().backgroundImage = UIImage()
        FirebaseApp.configure()
        return true
    }
}

@main
struct YourApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var sellerViewModel = SellerViewModel()
    //여기에 추가
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(sellerViewModel)
            }
        }
    }
}
