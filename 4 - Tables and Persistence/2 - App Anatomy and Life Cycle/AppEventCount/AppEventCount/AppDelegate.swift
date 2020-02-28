//
//  AppDelegate.swift
//  AppEventCount
//
//  Created by Kaan Baylas on 10.02.2020.
//  Copyright © 2020 Kaan Baylas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    
    var viewController: ViewController?
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        viewController = window?.rootViewController as? ViewController
        
        viewController?.launchCount += 1
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication)
    {
        viewController?.resignActiveCount += 1
    }
    
    func applicationDidEnterBackground(_ application: UIApplication)
    {
        viewController?.didBackgroundCount += 1
    }
    
    func applicationWillEnterForeground(_ application: UIApplication)
    {
        viewController?.willBackgroundCount += 1
    }
    
    func applicationDidBecomeActive(_ application: UIApplication)
    {
        viewController?.didActiveCount += 1
        viewController?.updateView()
    }
    
    func applicationWillTerminate(_ application: UIApplication)
    {
        viewController?.terminateCount += 1
    }


}

