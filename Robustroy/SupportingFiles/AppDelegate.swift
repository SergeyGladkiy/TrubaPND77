//
//  AppDelegate.swift
//  TrubaPND77
//
//  Created by Serg on 28.07.2020.
//  Copyright © 2020 Sergey Gladkiy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //MARK:????!!!!
        Thread.sleep(forTimeInterval: 1)
        
        if #available(iOS 13.0, *) {
            
        } else {
            guard
                let appCoordinator: ApplicationCoordinatorProtocol = DependenceProvider.resolve()
                else {
                    objectDescription(self, function: #function)
                    return true
            }
            self.window = appCoordinator.prepareWindow()
            if window!.traitCollection.horizontalSizeClass == .regular {
                let systemFontAttributesForIPad = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
                UITabBarItem.appearance().setTitleTextAttributes(systemFontAttributesForIPad, for: .normal)
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

