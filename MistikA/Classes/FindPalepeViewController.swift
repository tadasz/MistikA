//
//  FindPalepeViewController.swift
//  MistikA
//
//  Created by Tadas Ziemys on 11/07/14.
//  Copyright (c) 2014 Tadas Ziemys. All rights reserved.
//

import UIKit
import MapKit

class FindPalepeViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var pictureView: UIImageView?
    @IBOutlet weak var accuracyLabel: UILabel?
    
    var locationManager = CLLocationManager()
    var region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "78E408FD-48DA-4325-9123-0AEA40925EFF"), identifier: "com.identifier")
    
    required init(coder aDecoder: NSCoder!)  {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.delegate = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.startRangingBeaconsInRegion(region)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        if !beacons!.isEmpty {
            var beacon = beacons![0] as CLBeacon
            let accuracy: Double = beacon.accuracy
            pictureView!.alpha = CGFloat(1.0 / accuracy)
            accuracyLabel!.text = "\(beacon.accuracy)"
            
            if beacon.proximity == CLProximity.Immediate {
                locationManager.stopMonitoringForRegion(region)
                UIAlertView(title: "Rrrrr...", message: "kaip tu mane radai? rrr....", delegate: self, cancelButtonTitle: "rrrr")
                
            }
            
        }

        
    }

}
