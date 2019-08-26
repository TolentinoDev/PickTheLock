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
    var Person = SKSpriteNode()
    //Create path for the person to follow
    var Path = UIBezierPath()
    //T/F for if the game has started or not
    var gameStarted = Bool()
    
    var movingClockwise = Bool()
    
    override func didMove(to view: SKView) {
        
        //Define Circle
        Circle = SKSpriteNode(imageNamed: "Circle")
        Circle.size = CGSize(width: 300, height: 300)
        Circle.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(Circle)
        
        //Define Person
        
        Person = SKSpriteNode(imageNamed: "Person")
        Person.size = CGSize(width: 40, height: 7)
        Person.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 122)
        // Rotates the person to a 90 degree angle
        Person.zRotation = 3.14 / 2
        self.addChild(Person)
        
        }
    
    func moveClockWise(){
        var dx = Person.position.x - self.frame.width / 2
        var dy = Person.position.y - self.frame.height / 2
        
        var rad = atan2(dy,dx)
        
        Path = UIBezierPath(arcCenter: CGPoint(x:self.frame.width / 2, y: self.frame.height / 2), radius: 120, startAngle: rad, endAngle: rad + CGFloat(M_PI * 4), clockwise: true)
        
        let follow = SKAction.follow(Path.cgPath, asOffset: false, orientToPath: true, speed: 200)
        Person.run(SKAction.repeatForever(follow).reversed())
        
    }
    func moveCounterClockWise(){
        
        var dx = Person.position.x - self.frame.width / 2
        var dy = Person.position.y - self.frame.height / 2
        
        var rad = atan2(dy,dx)
        
        Path = UIBezierPath(arcCenter: CGPoint(x:self.frame.width / 2, y: self.frame.height / 2), radius: 120, startAngle: rad, endAngle: rad + CGFloat(M_PI * 4), clockwise: true)
        
        let follow = SKAction.follow(Path.cgPath, asOffset: false, orientToPath: true, speed: 200)
        Person.run(SKAction.repeatForever(follow))
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false{
            moveClockWise()
            movingClockwise == true
            gameStarted = true
            
        }
        else if gameStarted == true {
            if movingClockwise == true{
                moveCounterClockWise()
                movingClockwise == false
            }
            else if movingClockwise == false{
                moveClockWise()
                movingClockWise == true
                
            }
        
 
    }
    

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
}
