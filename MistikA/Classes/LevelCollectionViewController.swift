//
//  LevelCollectionViewController.swift
//  MistikA
//
//  Created by Tadas Ziemys on 16/07/14.
//  Copyright (c) 2014 Tadas Ziemys. All rights reserved.
//

import UIKit

protocol LevelCollectionViewControllerDelegate {
    func levelChoosen(level: Int)
}


let reuseIdentifier = "ChooseLevelCell"

class LevelCollectionViewController: UICollectionViewController {

    var delegate: LevelCollectionViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView.registerClass(ChooseLevelCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.registerNib(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
        
        var flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake(125, 125)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        self.collectionView.collectionViewLayout = flowLayout
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    //MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: - UICollectionViewDataSource


    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return GameController.sharedInstance.currentGameStage.toRaw() + 1
    }

    override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as ChooseLevelCell
    
        cell.backgroundColor = UIColor.clearColor()
        
        switch indexPath!.row {
        case 0:
            cell.imageView!.image = UIImage(named: "compass")
        case 1:
            cell.imageView!.image = UIImage(named: "birds")
        case 2:
            cell.imageView!.image = UIImage(named: "ferox")
        case 3:
            cell.imageView!.image = UIImage(named: "fibonacci")
        case 4:
            cell.imageView!.image = UIImage(named: "devil")
        case 5:
            cell.imageView!.image = UIImage(named: "master_criminal_achievement") //ibeacon
        case 6:
            cell.imageView!.image = UIImage(named: "church")
        default:
            println("default")
        }
        
//        cell.imageView.text = "\(indexPath!.row + 1)"
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
        delegate?.levelChoosen(indexPath!.row)
    }

    // pragma mark <UICollectionViewDelegate>

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    func collectionView(collectionView: UICollectionView!, shouldHighlightItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    func collectionView(collectionView: UICollectionView!, shouldSelectItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    func collectionView(collectionView: UICollectionView!, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return false
    }

    func collectionView(collectionView: UICollectionView!, canPerformAction action: String!, forItemAtIndexPath indexPath: NSIndexPath!, withSender sender: AnyObject!) -> Bool {
        return false
    }

    func collectionView(collectionView: UICollectionView!, performAction action: String!, forItemAtIndexPath indexPath: NSIndexPath!, withSender sender: AnyObject!) {
    
    }
    */

}
