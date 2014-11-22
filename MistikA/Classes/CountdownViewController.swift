//
//  CountdownViewController.swift
//  MistikA
//
//  Created by Tadas Ziemys on 18/08/14.
//  Copyright (c) 2014 Tadas. All rights reserved.
//

import UIKit

class CountdownViewController: BaseViewController {

    @IBOutlet weak var textLabel: LTMorphingLabel?
    
    override init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var timer: NSTimer?
   
    func updateTimer() {
        var dateFormater = NSDateFormatter()
        dateFormater.dateFormat = ("dd:MM:yyyy HH:mm:ss")
        
        
        var date = dateFormater.dateFromString("13:09:2014 21:21:21")
        let now = NSDate()
        var timeLeft = date!.timeIntervalSinceDate(now)
        
        textLabel?.text = "\(timeLeft)"
        
//        println("time left: \(timeLeft)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        
//        timer = NSTimer(timeInterval: 1.0, target: nil, selector: "updateTimer", userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
