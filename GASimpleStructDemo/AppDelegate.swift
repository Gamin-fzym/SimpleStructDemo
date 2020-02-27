//
//  AppDelegate.swift
//  GASimpleStructDemo
//
//  Created by Gamin on 2020/2/25.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds);
        window?.backgroundColor = UIColor.white;
        
        let uDefault = UserDefaults.standard;
        if uDefault.object(forKey: "openGuide") != nil {
            let tabbar = GARootTabBarController();
            window?.rootViewController = tabbar;
        } else {
            let guide = GAGuideViewController();
            window?.rootViewController = guide;
        }
        
        window?.makeKeyAndVisible();
        return true
    }

}

