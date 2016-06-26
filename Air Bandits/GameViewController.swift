//
//  GameViewController.swift
//  Air Bandits
//
//  Created by Kyle John on 2016-06-24.
//  Copyright (c) 2016 Kyle John. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit

class GameViewController: UIViewController, GKGameCenterControllerDelegate {
    
    var score = Int()
    
    @IBOutlet var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authenticateLocalPlayer()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    @IBAction func addPoints(sender: AnyObject) {
        
        score++
        scoreLabel.text = "\(score)"
        
    }
    
    @IBAction func done(sender: AnyObject) {
        
        saveHighscore(score)
        showLeader()
        
    }
    
    //shows leaderboard screen
    func showLeader() {
        let vc = self.view?.window?.rootViewController
        let gc = GKGameCenterViewController()
        gc.gameCenterDelegate = self
        vc?.presentViewController(gc, animated: true, completion: nil)
    }
    
    //hides leaderboard screen
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController!)
    {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //send high score to leaderboard
    func saveHighscore( number :Int) {
        
        //check if user is signed in
        if GKLocalPlayer.localPlayer().authenticated {
            
            let scoreReporter = GKScore(leaderboardIdentifier: "air_bandits_ladder") //leaderboard id here
            
            scoreReporter.value = Int64(number) //score variable here (same as above)
            
            let scoreArray: [GKScore] = [scoreReporter]
            
            GKScore.reportScores(scoreArray, withCompletionHandler: nil)
            
        }
        
    }
    
    
    //initiate gamecenter
    func authenticateLocalPlayer(){
        
        let localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(view, error) in
            
            if view != nil {
                
                self.presentViewController(view!, animated: true, completion: nil)
            }
                
            else {
                print(GKLocalPlayer.localPlayer().authenticated)
            }
        }
        
    }
    
}
