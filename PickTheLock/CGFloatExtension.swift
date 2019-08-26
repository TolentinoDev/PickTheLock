//
//  CGFloatExtension.swift
//  PickTheLock
//
//  Created by Ryan Tolentino on 8/26/19.
//  Copyright © 2019 Ryan Tolentino. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGFloat{
    
    public static func random() -> CGFloat{
        
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    public static func random(min min : CGFloat, max : CGFloat) -> CGFloat{
        
        return CGFloat.random() * (max - min) + min
    }
}
