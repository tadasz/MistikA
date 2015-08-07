//
//  AppDelegate.swift
//  MistikA
//
//  Created by Tadas Ziemys on 11/07/14.
//  Copyright (c) 2014 Tadas Ziemys. All rights reserved.
//

import UIKit
import MapKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
                            
    var window: UIWindow?
    var locationManager: CLLocationManager = CLLocationManager()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
//        GameController.sharedInstance.currentGameStage = .OpticalIllusionPuzzle
        
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.None)
        
        locationManager.delegate = self
        
        if locationManager.respondsToSelector(Selector("requestAlwaysAuthorization")) {
            locationManager.requestAlwaysAuthorization()
        }
        
//        locationManager.startMonitoringForRegion(regionSenamiestis)
//        locationManager.startMonitoringForRegion(klinika)
//        
//        locationManager.startMonitoringForRegion(regionSpace)
        
//        let gameStage = GameStage.TimerPuzzle
//        GameController.sharedInstance.currentGameStage = GameStage.LocationPuzzle
        
        
        println("gameStage: \(GameController.sharedInstance.currentGameStage.rawValue)")
        
//        if UIApplication.instancesRespondToSelector(Selector("registerUserNotificationSettings:")) {
//            var settings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: <#UIUserNotificationType#>, categories: <#NSSet?#>)
//            UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings: UIUserNotificationSettings)
//        }
        
//        if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
//            [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil]];
//        }
        
        return true
    }
    
//    
//    var regionSenamiestis = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 54.8958859, longitude: 23.8988002), radius: 2000, identifier: "Madrid")
//    var klinika = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 54.9165753, longitude: 23.9526839), radius: 1000, identifier: "Santiago")
//    var regionSpace = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 54.9032619, longitude: 23.9599558), radius: 1000, identifier: "Space")
    
    
    func locationManager(manager: CLLocationManager!, didDetermineState state: CLRegionState, forRegion region: CLRegion!) {
        println("Something happened!")
        println("state - \(state)")
        println("region - \(region)")
        
        var notification = UILocalNotification()
        var regionStateStr = ""
        if (state == CLRegionState.Inside) {
            regionStateStr = "Inside"
        } else if state == CLRegionState.Outside {
            regionStateStr = "Outside"
        } else {
            regionStateStr = "Unknown"
        }
        
        if (state == CLRegionState.Inside) {
            if (region.identifier == "Madrid" || region.identifier == "Space") {
                notification.alertBody = "Tu esi jau arčiau... Madride... Mistika?"
                notification.soundName = "laugh.aiff"
                UIApplication.sharedApplication().presentLocalNotificationNow(notification)
                UIApplication.sharedApplication().applicationIconBadgeNumber = 777
            } else if (region.identifier == "Santiago") {
                notification.alertBody = "Atvykai į mistikos šalį..."
                notification.soundName = "laugh.aiff"
                UIApplication.sharedApplication().presentLocalNotificationNow(notification)
                UIApplication.sharedApplication().applicationIconBadgeNumber = 69
                GameController.sharedInstance.currentGameStage = GameStage.TimerPuzzle
            }
            UIApplication.sharedApplication().presentLocalNotificationNow(notification)
        }
    }
    
    //Notifications
    
    var soundPlayer: AVAudioPlayer?
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        var error: NSError?
        var url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("laugh", ofType: "aiff")!)
        soundPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
        soundPlayer!.volume = 0
        if !soundPlayer!.play() {
            println("negroja!!!")
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName("localNotification", object: notification)
        
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

