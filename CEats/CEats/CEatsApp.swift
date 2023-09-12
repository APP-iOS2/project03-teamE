//
//  CEatsApp.swift
//  CEats
//
//  Created by 박범수 on 2023/09/04.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct CEatsApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var showMainView = false
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showMainView {
                    ContentView()
                } else {
                    SplashView()
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation {
                                    showMainView = true
                                }
                            }
                        }
                }
            }
        }
    }
}