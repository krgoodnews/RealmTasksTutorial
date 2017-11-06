//
//  AppDelegate.swift
//  RealmTasksTutorial
//
//  Created by Goodnews on 2017. 11. 6..
//  Copyright © 2017년 goodnews. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = UINavigationController(rootViewController: ViewController(style: .plain))
		window?.makeKeyAndVisible()
		return true
	}
}
