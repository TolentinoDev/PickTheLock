//
//  GameScene.swift
//  PickTheLock
//
//  Created by Ryan Tolentino on 8/26/19.
//  Copyright © 2019 Ryan Tolentino. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //private var label : SKLabelNode?
    //private var spinnyNode : SKShapeNode?
    
    //Create your People
    
    var Circle = SKSpriteNode()
    var Player = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        //Define Circle
        Circle = SKSpriteNode(imageNamed: "Circle")
        Circle.size = CGSize(width: 300, height: 300)
        Circle.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(Circle)
        
        //Define Person
        
        

        }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
 
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
