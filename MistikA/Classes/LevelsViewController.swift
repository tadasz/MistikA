//
//  LevelsViewController.swift
//  MistikA
//
//  Created by Tadas Ziemys on 16/07/14.
//  Copyright (c) 2014 Tadas Ziemys. All rights reserved.
//

import UIKit

class LevelsViewController: UIViewController, LevelCollectionViewControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView?
    var collectionView: LevelCollectionViewController?
    
    required init(coder aDecoder: NSCoder)  {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
        
//        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
//        
//        visualEffectView.frame = imageView.bounds
//        visualEffectView.alpha = 0
//        if collectionView {
//            collectionView!.view.alpha = 0
//        }
//        imageView.addSubview(visualEffectView)        
//        
//        UIView.animateWithDuration(1.0, animations: {
//            visualEffectView.alpha = 1
//            }, completion: {
//                _ in
//                UIView.animateWithDuration(1.0) {
//                    self.collectionView!.view.alpha = 1
//                }
//            })

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func levelChoosen(level: Int) {
        switch level {
        case 0:
            performSegueWithIdentifier("show_MapRiddle", sender: self)
        case 1:
            let flappyStoryboard = UIStoryboard(name: "FlappyMain", bundle: nil)
            let flappyViewController = flappyStoryboard.instantiateInitialViewController() as! FlappyViewController
            self.presentViewController(flappyViewController, animated: true, completion: nil)
        case 2:
            performSegueWithIdentifier("showIlusions_segue", sender: self)
        case 3:
            performSegueWithIdentifier("showStereogram_segue", sender: self)
        case 4:
            performSegueWithIdentifier("showFirstLevel_segue", sender: self)
        case 5:
            performSegueWithIdentifier("showTimerView", sender: self)
        case 6:
            performSegueWithIdentifier("showFinalPuzzle_segue", sender: self)
        default:
            println("other level")
        }

    }

    
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "embededLevelCollection_segue" {
            collectionView = segue.destinationViewController as? LevelCollectionViewController
            collectionView!.delegate = self
        }
    }
    

}
