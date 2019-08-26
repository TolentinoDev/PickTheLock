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
    
    //Create your Circle, People, and Dot
    var Circle = SKSpriteNode()
    var Person = SKSpriteNode()
    var Dot = SKSpriteNode()
    
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
        Person.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 120)
        // Rotates the person to a 90 degree angle
        Person.zRotation = 3.14 / 2
        Person.zPosition = 2.0
        self.addChild(Person)
        AddDot()
        

        
        }
    
    func AddDot(){
        //Define Dot
        Dot = SKSpriteNode(imageNamed: "Dot")
        Dot.size = CGSize(width: 30, height: 30)
        //Brings dot from behind circle
        Dot.zPosition = 1.0
        let dx = Person.position.x - self.frame.width / 2
        let dy = Person.position.y - self.frame.height / 2
        
        let rad = atan2(dy,dx)
        
        if movingClockwise == true{
            let tempAngle = CGFloat.random(min: rad + 1.0, max: rad + 2.5)
            let Path2 = UIBezierPath(arcCenter: CGPoint(x:self.frame.width / 2 , y: self.frame.height / 2), radius: 120, startAngle: tempAngle, endAngle: tempAngle + CGFloat(Double.pi * 4), clockwise: true)
            Dot.position = Path2.currentPoint
            
        }
        else if movingClockwise == false{
            let tempAngle = CGFloat.random(min: rad - 1.0, max: rad - 2.5)
            let Path2 = UIBezierPath(arcCenter: CGPoint(x:self.frame.width / 2 , y: self.frame.height / 2), radius: 120, startAngle: tempAngle, endAngle: tempAngle + CGFloat(Double.pi * 4), clockwise: true)
            Dot.position = Path2.currentPoint
        }
        self.addChild(Dot)
        
    }
    
    
    
    
    func moveClockWise(){
        let dx = Person.position.x - self.frame.width / 2
        let dy = Person.position.y - self.frame.height / 2
        
        let rad = atan2(dy,dx)
        
        Path = UIBezierPath(arcCenter: CGPoint(x:self.frame.width / 2, y: self.frame.height / 2), radius: 120, startAngle: rad, endAngle: rad + CGFloat(Double.pi * 4), clockwise: true)
        
        let follow = SKAction.follow(Path.cgPath, asOffset: false, orientToPath: true, speed: 200)
        Person.run(SKAction.repeatForever(follow).reversed())
        
    }
    func moveCounterClockWise(){
        
        let dx = Person.position.x - self.frame.width / 2
        let dy = Person.position.y - self.frame.height / 2
        
        let rad = atan2(dy,dx)
        
        Path = UIBezierPath(arcCenter: CGPoint(x:self.frame.width / 2, y: self.frame.height / 2), radius: 120, startAngle: rad, endAngle: rad + CGFloat(Double.pi * 4), clockwise: true)
        
        let follow = SKAction.follow(Path.cgPath, asOffset: false, orientToPath: true, speed: 200)
        Person.run(SKAction.repeatForever(follow))
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false{
            moveClockWise()
            movingClockwise = true
            gameStarted = true
            
        }
        else if gameStarted == true {
            if movingClockwise == true{
                moveCounterClockWise()
                movingClockwise = false
            }
            else if movingClockwise == false{
                moveClockWise()
                movingClockwise = true
                
            }
        
 
    }
    }
    

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
