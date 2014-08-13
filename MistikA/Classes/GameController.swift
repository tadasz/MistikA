//
//  GameController.swift
//  MistikA
//
//  Created by Tadas Ziemys on 29/07/14.
//  Copyright (c) 2014 Tadas Ziemys. All rights reserved.
//

import Foundation

enum GameStage: Int {
    case MapPuzzle = 0, OpticalIllusionPuzzle, FlappyPuzzle, StereogramPuzzle, IndoorPuzzle, RestaurantPuzzle
    
    static var allPuzzles = [MapPuzzle, OpticalIllusionPuzzle, FlappyPuzzle, StereogramPuzzle, IndoorPuzzle, RestaurantPuzzle]
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
        NSUserDefaults.standardUserDefaults().setObject(currentGameStage.toRaw(), forKey: CURRENT_GAME_STAGE_KEY)
    }
    }
    
    var stageProgress: Int = 0 {
    didSet {
        NSUserDefaults.standardUserDefaults().setObject(stageProgress, forKey: STAGE_PROGRESS_KEY)
    }
    }
    
    func loadInitialValues() {
        let stageRaw: Int? = NSUserDefaults.standardUserDefaults().objectForKey(CURRENT_GAME_STAGE_KEY) as Int?
        if  stageRaw != nil {
            currentGameStage = GameStage.fromRaw(stageRaw!)!
        }
        else {
            currentGameStage = GameStage.fromRaw(0)!
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
        currentGameStage = GameStage.fromRaw((currentGameStage.toRaw() + 1))!
        stageProgress = 0
    }
}