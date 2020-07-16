//
//  K.swift
//  ARDicee
//
//  Created by Narayan Sajeev on 7/15/20.
//  Copyright © 2020 Narayan Sajeev. All rights reserved.
//

import UIKit

// create a class to store the constants
class K {
    
//    create a constant for the diceScene
    static let diceScene = "art.scnassets/diceCollada.scn"
    
//    create a constant for the diceNode
    static let diceNode = "Dice"
    
//    create a constant for the default lighting
    static let autoenablesDefaultLighting = true
    
//    create a constant for the statistics
    static let showsStatistics = true
    
//    create a constant for the extra rotations of the die
    static let rotationConstant = Float(5)
    
//    create a constant for the duration of the rolling
    static let duration = 0.5
    
//    create a constant for the recursive searching
    static let recursiveSearching = true
    
//    create a constant for the column number to search for the x, y, and z components
    static let columnNumber = 3
    
//    create a constant for the y-component of the vector
    static let yComponent = Float(0)
    
//    as the plane is by default vertical, and we need to make it horizontal, we must rotate the plane 90 degrees
//    the "angle" parameter takes in radians, so we must convert 90 degrees to radians by dividing π by 2
//    as the rotation function rotates counter-clockwise, in order to rotate the plane clockwise, we must put a negative in front of the angle
    
//    create a constant for the angle rotation
    static let angleRotation = -Float.pi/2

//    create a constant for the x-rotation
    static let xRotation = Float(1)
    
//    create a constant for the y-rotation
    static let yRotation = Float(0)
    
//    create a constant for the z-rotation
    static let zRotation = Float(0)
    
//    since the random number generator takes in an integer of type UInt32, we must convert it to that
    
//    create a constant for the top of the random number range
    static let randomMax = UInt32(4)
    
//    since the random number generator results in an integer of type UInt32, we must convert it to that
    
//    create a constant for the number we need to add to the random number
    static let addToRandom = UInt32(1)
    
//    create a constant to turn the number of faces rotated into radians
    static let radiansConvert = Float.pi/2
    
}
