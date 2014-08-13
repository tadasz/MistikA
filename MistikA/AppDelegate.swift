//
//  AppDelegate.swift
//  MistikA
//
//  Created by Tadas Ziemys on 11/07/14.
//  Copyright (c) 2014 Tadas Ziemys. All rights reserved.
//

import UIKit
import MapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
                            
    var window: UIWindow?
    var locationManager: CLLocationManager = CLLocationManager()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        // Override point for customization after application launch.
        
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.None)
        
        locationManager.delegate = self
        
//        GameController.sharedInstance.currentGameStage = GameStage.StereogramPuzzle
        
        
        return true
    }
    
    func locationManager(manager: CLLocationManager!, didDetermineState state: CLRegionState, forRegion region: CLRegion!) {
        var notification = UILocalNotification()
        if state == CLRegionState.Inside {
            notification.alertBody = "Tai faktas! Atidaryk mane!"
            println("inside...")
        }
        else if state == CLRegionState.Outside {
            println("outside...")
        }
        else {
            return
        }
        
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    //state restoration
    
    func application(application: UIApplication!, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]!) -> Bool {
        return true
    }
    
//    func application(application: UIApplication!, didDecodeRestorableStateWithCoder coder: NSCoder!) {
//        
//    }
//    
//    func application(application: UIApplication!, shouldRestoreApplicationState coder: NSCoder!) -> Bool {
//        return true
//    }
//    
//    func application(application: UIApplication!, shouldSaveApplicationState coder: NSCoder!) -> Bool {
//        return true
//    }

}

