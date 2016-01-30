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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var timer: NSTimer?
   
    func updateTimer() {
        let dateFormater = NSDateFormatter()
        dateFormater.dateFormat = ("dd:MM:yyyy HH:mm:ss")
        
        
        let date = dateFormater.dateFromString("28:11:2014 19:36:36")
        let now = NSDate()
        let timeLeft = date!.timeIntervalSinceDate(now)
        
        if timeLeft < 0 {
            textLabel?.text = "Išaušo mistinė valanda..."
            timer?.invalidate()
            timer = nil
            
            GameController.sharedInstance.currentGameStage = GameStage.FinalPuzzle
            finishStage()
        } else {
            textLabel?.text = "\(timeLeft)"
        }
        
        
    
        
//        println("time left: \(timeLeft)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        
//        timer = NSTimer(timeInterval: 1.0, target: nil, selector: "updateTimer", userInfo: nil, repeats: true)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func finishStage() {
        let button: UIButton = UIButton(type: UIButtonType.Custom)
        button.frame = self.view.bounds
        button.addTarget(self, action: Selector("bringMeBack"), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        
        playSoundWin()
    }
    
    func bringMeBack() {
        dismissViewControllerAnimated(true, completion: nil)
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
