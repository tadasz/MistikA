//
//  BaseViewController.swift
//  MistikA
//
//  Created by Tadas Ziemys on 29/07/14.
//  Copyright (c) 2014 Tadas Ziemys. All rights reserved.
//

import UIKit
import AVFoundation

let conts_GoBack = 84756

class BaseViewController: UIViewController, UIAlertViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var gestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swiped:"))
        gestureRecognizer.direction = UISwipeGestureRecognizerDirection.Right
        gestureRecognizer.delaysTouchesBegan = true
        view.addGestureRecognizer(gestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)        
        player.stop()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Go back
    
    func swiped(object: AnyObject) {
        var alert = UIAlertView(title: "pasiduodi?", message: "o jeigu tai mistika...", delegate: self, cancelButtonTitle: "gal..", otherButtonTitles: "atgal")
        alert.tag = conts_GoBack
        alert.show()
    }
    
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        
        if alertView.tag == 84756 {
            if buttonIndex == 1 {
                dismissViewControllerAnimated(true, completion: nil)
            }
            
        }
        
    }
    
    //MARK: - Sounds
    var player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("wrong1", ofType: "mp3")!), fileTypeHint: "mp3", error: nil)
    
    func playSoundWrong() {
        if player.playing {
            player.stop()
        }
        var fileName: String = "wrong\(arc4random_uniform(18) + 1)"
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileName, ofType: "mp3")!), fileTypeHint: "mp3", error: nil)
        player.play()
    }
    
    func playSoundWin() {
        if player.playing {
            player.stop()
        }
        
        var fileName: String = "mistika"
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileName, ofType: "wav")!), fileTypeHint: "wav", error: nil)
        player.numberOfLoops = -1
        player.play()
    }

}
