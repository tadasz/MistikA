//
//  MapRiddleViewController.swift
//  MistikA
//
//  Created by Tadas Ziemys on 23/07/14.
//  Copyright (c) 2014 Tadas Ziemys. All rights reserved.
//

import UIKit

enum PuzzleState: Int {
    case firstStart = 0
    case inProgress
    case solved
}

struct MapLevel {
    var description: String?
    var fileName: String?
    var possibleAnswers: [String] = [String]()
}

class MapRiddleViewController: BaseViewController, UITextFieldDelegate, LTMorphingLabelDelegate {

    @IBOutlet weak var textLabel: LTMorphingLabel?
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var riddleImageView: UIImageView!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var finalButton: UIButton!
    @IBOutlet weak var answerBarHeight: NSLayoutConstraint!
    
    var currentString: String? {
    didSet {
        textLabel!.text = currentString
    }
    }
    
    override init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    var currentLevelCount = GameController.sharedInstance.stageProgress
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO: check if stage was cleared. if so, show clue if not let player continue
        
        if GameController.sharedInstance.currentGameStage == GameStage.MapPuzzle {
            textLabel!.morphingEffect = LTMorphingEffect.Sparkle
            textLabel!.delegate = self
            // Do any additional setup after loading the view.
            
            answerTextField.becomeFirstResponder()
            answerTextField.delegate = self
            
            showPuzzle()
        }
        else {
            finishStage()
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        currentString = "kas tai?"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 
    
    func showPuzzle() {
        let count: Int = MapPuzzle.allValues.count
        if  count > currentLevelCount {
            if let level = MapPuzzle.fromRaw(currentLevelCount) {
                riddleImageView!.image = UIImage(named: level.fileName)
            }
        }
    }
    
    // MARK: - Button actions

    @IBAction func checkAnswer(sender: AnyObject) {
        
        if let level = MapPuzzle.fromRaw(currentLevelCount) {
            println("level - \(level.toRaw()), answers = \(level.answers)")
            if level.isCorrectAnswer(answerTextField.text) {
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
        else {
            println("pabaiga!")
            GameController.sharedInstance.finishedLevel()
//            currentLevelCount = 0
            finishStage()
        }
        
        self.answerTextField.text = ""
    }
    
    @IBAction func finalButtonClicked(sender: UIButton) {
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
    
    
    
    // MARK: - Morphing label
    
    func morphingDidComplete(label: LTMorphingLabel) {
        if currentString == "kas tai?" {
            currentString = "kur tai?"
        }
        else if currentString == "kur tai?" {
            currentString = "kas tai? kur tai?"
        }
        else {
            currentString = "kas tai?"
        }
        
    }
    
    // MARK: - UITextField
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        checkAnswer(0)
        return true
    }
    
    func finishStage() {
        answerBarHeight.constant = 0
        view.setNeedsLayout()
        
        self.textLabel!.hidden = true
        self.answerTextField!.hidden = true
        answerButton.hidden = true
        riddleImageView.image = UIImage(named: "epic-win.jpg")
        riddleImageView.contentMode = UIViewContentMode.ScaleAspectFill
    }

}
