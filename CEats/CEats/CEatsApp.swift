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
        UITabBar.appearance().backgroundColor = .systemBackground
        UITabBar.appearance().backgroundImage = UIImage()
        FirebaseApp.configure()
        return true
    }
}

@main
struct CEatsApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var restaurantViewModel = RestaurantViewModel()
    @StateObject var userViewModel = UserViewModel()
    @State private var showMainView = false
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showMainView {
                    ContentView()
                        .environmentObject(restaurantViewModel)
                        .environmentObject(userViewModel)
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
            .onAppear {
//                resetFirebaseData()
                userViewModel.login()
                restaurantViewModel.fetchAllRestaurant()
            }
        }
    }
    func resetFirebaseData() {
        CEatsFBManager.shared.create(data: userViewModel.user)
        CEatsFBManager.shared.uploadDummyArray(datas: Seller.dummyArray)
        CEatsFBManager.shared.uploadDummyArray(datas: Restaurant.sampleDummys)
    }
}
