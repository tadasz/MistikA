//
//  StereoIllusionViewController.swift
//  MistikA
//
//  Created by Tadas Ziemys on 12/08/14.
//  Copyright (c) 2014 Tadas. All rights reserved.
//

import UIKit

class StereoIllusionViewController: BaseViewController {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var answerButton: UIButton!
    
    var currentLevelCount = GameController.sharedInstance.stageProgress
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if GameController.sharedInstance.currentGameStage == GameStage.StereogramPuzzle {
            showPuzzle()
        }
        else
        {
            finishStage()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tryAnswering(sender: AnyObject) {
        let alert = UIAlertView(title: "ar pamatei?", message: "parasyk ka matai", delegate: self, cancelButtonTitle: "OK")
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.tag = 6554
        alert.show()
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        if alertView.tag == 6554 {
            if buttonIndex == 0 {
                let enteredText = alertView.textFieldAtIndex(0)?.text
                
                if let level = StereoIllusionPuzzle(rawValue: currentLevelCount) {
                    if level.isCorrectAnswer(enteredText!) {
                        print("teisingai!")
                        GameController.sharedInstance.stageProgress++
                        currentLevelCount++
                        showPuzzle()
                    }
                    else {
                        print("neteisingai!")
                        playSoundWrong()
                    }
                }
            }
        }
    }
    
    func showPuzzle() {
        if let level = StereoIllusionPuzzle(rawValue: currentLevelCount) {
            let imgName = level.fileName
            print("imgName = \(imgName)")
            myImageView.image = UIImage(named: imgName);
        }
        else {
            print("pabaiga!")
            GameController.sharedInstance.finishedLevel()
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
        myImageView.image = UIImage(named: "winnerisyou.jpg")
        myImageView.contentMode = UIViewContentMode.ScaleAspectFit
        
        let button: UIButton = UIButton(type: UIButtonType.Custom)
        button.frame = self.view.bounds
        button.addTarget(self, action: Selector("bringMeBack"), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        
        playSoundWin()
    }
    
    func bringMeBack() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}


