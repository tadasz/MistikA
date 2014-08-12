//
//  ViewController.swift
//  MistikA
//
//  Created by Tadas Ziemys on 11/07/14.
//  Copyright (c) 2014 Tadas Ziemys. All rights reserved.
//

import UIKit
import MapKit

class IndoorPuzzleViewController: BaseViewController, CLLocationManagerDelegate, UIAlertViewDelegate {
                            
    @IBOutlet weak var textLabel: LTMorphingLabel?
    @IBOutlet weak var secondTextLabel: LTMorphingLabel?
    
    @IBOutlet weak var firstButton: UIButton?
    @IBOutlet weak var secondButton: UIButton?
    
    var i = 0
    var j = 0
    var texts: Array<String> = ["Ar tai yra mistika?","Ar tai yra nežinomybė?","Kas slepiasi?","Už jūrų?","Už marių?","Už kalnų?","Kas tai pasakys?","Kas yra mistika?","..mistika. .","s. ..tka. .",". ..a.."]
    var secondTexts = ["kas","skaito","raso","valgyt","nepraso","prie lengto","prie gaubto" ,"prie stogo, virsuj", "kur fotbolas dvelkia","eiki tu..."]
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        performAction(1)
        secondTextLabel!.morphingEffect = LTMorphingEffect.Evaporate
        textLabel!.morphingEffect = LTMorphingEffect.Pixelate
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func performAction(sender: AnyObject) {
        
        if countElements(texts) <= i {
            i = 0
            j++
        }
        
        var text = texts[i++]
        textLabel!.text = text
        
        if j == 3 {
            firstButton!.hidden = true
            UIView.animateWithDuration(2.5,
                animations: {
                    self.textLabel!.alpha = 0
                    self.secondTextLabel!.alpha = 1
                }, completion: {
                (value: Bool) in
                    self.secondButton!.hidden = false
                    self.i = 0
                    self.j = 0
            })
        }
    }
    
    @IBAction func performSecondAction(sender: AnyObject) {

        if countElements(secondTexts) <= i {
            i = 0
            j++
        }
        
        var text = secondTexts[i++]
        secondTextLabel!.text = text
        

        
        if j == 2 {
            registerForBeacon()
        }
        
    }
    
    let beaconIdentifier = "com.tadas.mistika.beikonas"
    var uuid: NSUUID = NSUUID(UUIDString: "78E408FD-48DA-4325-9123-0AEA40925EFF")
    var major: NSNumber?
    var minor: NSNumber?
    var monitoredRegion: CLBeaconRegion?
    
    
    func registerForBeacon() {
        if (monitoredRegion == nil) {
            monitoredRegion = CLBeaconRegion(proximityUUID: uuid, identifier: beaconIdentifier)
            self.locationManager.delegate = self
            self.locationManager.startMonitoringForRegion(monitoredRegion)
        }
        
        
        var region = locationManager.monitoredRegions.member(monitoredRegion) as? CLBeaconRegion
        if region == nil
//        {
////            self.enabled = YES;
//            self.uuid = region!.proximityUUID;
//            self.major = region!.major;
//            self.minor = region!.minor;
////            self.notifyOnEntry = region.notifyOnEntry;
////            self.notifyOnExit = region.notifyOnExit;
////            self.notifyOnDisplay = region.notifyEntryStateOnDisplay;
//        }
//        else
        {
//            self.uuid = 
            self.major = nil
            self.minor = nil
            self.locationManager.delegate = self
            if self.locationManager.respondsToSelector(Selector("startMonitoringForRegion:")) {
                println("yes respond")
                self.locationManager.startMonitoringForRegion(monitoredRegion)
            } else {
                println("no respond")
            }
//            self.notifyOnEntry = self.notifyOnExit = YES;
//            self.notifyOnDisplay = NO;
        }
    }
    
//    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
//        
//    }
    
    func locationManager(manager: CLLocationManager!, didStartMonitoringForRegion region: CLRegion!) {
        manager.requestStateForRegion(monitoredRegion)
    }
    
    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        println("didEnterRegion...")
        enteredRegion()
    }
    
    func locationManager(manager: CLLocationManager!, didDetermineState state: CLRegionState, forRegion region: CLRegion!) {
        println("didDetermineState")
        if region.identifier == beaconIdentifier {
            if (state == CLRegionState.Inside) {
                println("didDetermineState, inside")
                enteredRegion()
            } else if (state == CLRegionState.Outside) {
                exitedRegion()
            }
        }
    }
    
    var showingEnteredAlert = false
    var showingExitAlert = false
    
    func enteredRegion() {
        if !showingEnteredAlert {
            let alert = UIAlertView(title: "jau arti...", message: "ieškok manęs... rrr... grrr...", delegate: self, cancelButtonTitle: "gerai")
            alert.tag = 1
            alert.show()
            showingEnteredAlert = true
        }
    }
    
    func exitedRegion() {
        if !showingExitAlert {
            let alert = UIAlertView(title: "ne čia...", message: "aš kiturrrr... rrr.. rr.", delegate: self, cancelButtonTitle: "utruti")
            alert.tag = 2
            alert.show()
            showingExitAlert = true
        }
    }
    
    override func alertView(alertView: UIAlertView!, didDismissWithButtonIndex buttonIndex: Int) {
        if alertView.tag == 1 {
            showingEnteredAlert = false
            locationManager.stopMonitoringForRegion(monitoredRegion)

            NSUserDefaults.standardUserDefaults().setValue("FindPalepe", forKey: "place")
            performSegueWithIdentifier("show_FindPalepe", sender: self)
            
        }
        else if alertView.tag == 2 {
            showingExitAlert = false
        }
        else {
            super.alertView(alertView, didDismissWithButtonIndex: buttonIndex)
        }
        
        

    }
}
