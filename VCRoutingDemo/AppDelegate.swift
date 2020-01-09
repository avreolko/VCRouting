//
//  AppDelegate.swift
//  VCRoutingDemo
//
//  Created by Valentin Cherepyanko on 09.01.2020.
//  Copyright © 2020 Valentin Cherepyanko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.showFirstModule()
        return true
    }
}

private extension AppDelegate {
    func showFirstModule() {

        let seed: ModuleSeed = .tabBar([
            .plain(.green),
            .plain(.blue)
        ])

        let moduleBuilder = ModuleBuildersFactory().makeModuleBuilder(for: seed)

        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.window?.rootViewController = moduleBuilder().viewController
        self.window?.makeKeyAndVisible()
    }
}
