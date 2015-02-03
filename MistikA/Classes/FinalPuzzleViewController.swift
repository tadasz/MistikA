//
//  FinalPuzzleViewController.swift
//  MistikA
//
//  Created by Tadas Ziemys on 24/11/14.
//  Copyright (c) 2014 Tadas. All rights reserved.
//

import UIKit
import AVFoundation

class FinalPuzzleViewController: BaseViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var answerButton: UIButton!
    
    var currentLevelCount = GameController.sharedInstance.stageProgress
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GameController.sharedInstance.stageProgress = 0
        showPuzzle()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tryAnswering(sender: AnyObject) {
        let alert = UIAlertView(title: "mistika yra aplinkui", message: "pazvelk giliau ir atpazink realybe!", delegate: self, cancelButtonTitle: "OK")
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.tag = 6554
        alert.show()
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        if alertView.tag == 6554 {
            if buttonIndex == 0 {
                let enteredText = alertView.textFieldAtIndex(0)?.text
                
                if let level = FinalPuzzle(rawValue: currentLevelCount) {
                    if level.isCorrectAnswer(enteredText!) {
                        println("teisingai!")
                        GameController.sharedInstance.stageProgress++
                        currentLevelCount++
                        showPuzzle()
                    }
                    else {
                        println("neteisingai!")
                        playSoundWrong()
                    }
                }
            }
        }
    }
    
    func showPuzzle() {
        if let level = FinalPuzzle(rawValue: currentLevelCount) {
            let imgName = level.fileName
            println("imgName = \(imgName)")
            myImageView.image = UIImage(named: imgName);
        }
        else {
            println("pabaiga!")
//            GameController.sharedInstance.finishedLevel()
            finishStage()
        }
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    func finishStage() {
        answerButton.hidden = true
        myImageView.image = UIImage(named: "final_win.jpg")
        myImageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        let button: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        button.frame = self.view.bounds
//        button.addTarget(self, action: Selector("bringMeBack"), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        
        playSoundWin()
    }
    
    func bringMeBack() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func playSoundWin() {
        if player.playing {
            player.stop()
        }
        
        var fileName: String = "dream"
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileName, ofType: "mp3")!), fileTypeHint: "mp3", error: nil)
        player.numberOfLoops = -1
        player.play()
    }
    
}
