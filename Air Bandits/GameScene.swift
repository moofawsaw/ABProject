//
//  GameScene.swift
//  Air Bandits
//
//  Created by Kyle John on 2016-06-24.
//  Copyright (c) 2016 Kyle John. All rights reserved.
//

import SpriteKit
import GameKit

class GameScene: SKScene {
    
    
    
    var Player = SKSpriteNode(imageNamed: "BombIcon.png")
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        Player.position = CGPointMake(self.size.width / 2, self.size.height / 4)
        var Timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("SpawnBullets"), userInfo: nil, repeats: true)
        
        self.addChild(Player)
        
    }
    
    // Bullets
    
    func SpawnBullets(){
        
        let Bullet = SKSpriteNode(imageNamed: "BombIcon.png")
        Bullet.zPosition = -5
        Bullet.position = CGPointMake(Player.position.x, Player.position.y)
        let action = SKAction.moveToY(self.size.height + 30, duration: 1.0)
        Bullet.runAction(SKAction.repeatActionForever((action)))
        self.addChild(Bullet)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            Player.position.x = location.x
            
            
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let location = touch.locationInNode(self)
            
            Player.position.x = location.x
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}