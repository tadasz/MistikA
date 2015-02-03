//
//  GameController.swift
//  MistikA
//
//  Created by Tadas Ziemys on 29/07/14.
//  Copyright (c) 2014 Tadas Ziemys. All rights reserved.
//

import Foundation

enum GameStage: Int {
    case MapPuzzle = 0, FlappyPuzzle, OpticalIllusionPuzzle, StereogramPuzzle, LocationPuzzle, TimerPuzzle, FinalPuzzle
    
    static var allPuzzles = [MapPuzzle, FlappyPuzzle, OpticalIllusionPuzzle, StereogramPuzzle, LocationPuzzle, TimerPuzzle, FinalPuzzle]
}

let CURRENT_GAME_STAGE_KEY = "currentGameStage"
let STAGE_PROGRESS_KEY = "stageProgress"

class GameController: NSObject {
    class var sharedInstance : GameController {
    struct Static {
        static var onceToken : dispatch_once_t = 0
        static var instance : GameController? = nil {
            didSet {
                instance!.loadInitialValues()
            }
        }
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = GameController()
        }
        return Static.instance!
    }
    
    var currentGameStage: GameStage = GameStage.MapPuzzle {
    didSet {
        NSUserDefaults.standardUserDefaults().setObject(currentGameStage.rawValue, forKey: CURRENT_GAME_STAGE_KEY)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    }
    
    var stageProgress: Int = 0 {
    didSet {
        NSUserDefaults.standardUserDefaults().setObject(stageProgress, forKey: STAGE_PROGRESS_KEY)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    }
    
    func loadInitialValues() {
        let stageRaw: Int? = NSUserDefaults.standardUserDefaults().objectForKey(CURRENT_GAME_STAGE_KEY) as Int?
        if  stageRaw != nil {
            currentGameStage = GameStage(rawValue: stageRaw!)!
        }
        else {
            currentGameStage = GameStage(rawValue: 0)!
        }
        
        let stageProgressInMemory: Int? = NSUserDefaults.standardUserDefaults().objectForKey(STAGE_PROGRESS_KEY) as Int?
        
        if stageProgressInMemory != nil {
            stageProgress = stageProgressInMemory!
        }
        else {
            stageProgress = 0
        }
    }
    
    func finishedLevel() {
        currentGameStage = GameStage(rawValue: (currentGameStage.rawValue + 1))!
        stageProgress = 0
    }
}