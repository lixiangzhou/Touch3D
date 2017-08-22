//
//  AppDelegate.swift
//  Touch3D
//
//  Created by lixiangzhou on 2017/8/22.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if let launchOptions = launchOptions {
            let label = UILabel(frame: window!.bounds)
            label.text = launchOptions.description
            label.numberOfLines = 0
            label.backgroundColor = UIColor.blue
            window?.addSubview(label)
        }

        
        return true
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        print(shortcutItem.localizedTitle)
        print(shortcutItem.localizedSubtitle ?? "")
        print(shortcutItem.icon ?? "")
        print(shortcutItem.userInfo ?? [])
        print(shortcutItem.type)
    }


}

