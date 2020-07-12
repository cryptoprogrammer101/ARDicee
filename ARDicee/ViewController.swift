//
//  ViewController.swift
//  ARDicee
//
//  Created by Narayan Sajeev on 7/8/20.
//  Copyright © 2020 Narayan Sajeev. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
//        create a cube with a side length of 0.1m (10 cm)
//        slightly round corners of the cube
//        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
//        create a sphere with a radius of 0.2m, or 20cm
//        let sphere = SCNSphere(radius: 0.2)
        
//        create the material to go on the cube
//        let material = SCNMaterial()
        
//        set the color of the cube to blue
//        material.diffuse.contents = UIColor.blue
        
//        set the texture of the sphere to the moon
//        material.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
        
//        pass in the material to the cube
//        cube.materials = [material]
        
//        pass in the material to the sphere
//        sphere.materials = [material]
        
//        create a node
//        a node is a point in 3D space, representing position and transform
//        let node = SCNNode()
        
//        declare the position of the node
//        SCNVector3 is a 3D vector that has an x-position, y-position, and z-position
//        set the x-position to be 0, set the y-position to be 0.1 (raising the cube up 10 cm), and push the cube away from the user by setting the z-position to a negative number (-0.5 -> 50 cm in front)
//        +z -> towards the user, -z -> away from the user
//        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        
//        set the geometry of the node to the cube we created
//        node.geometry = cube
        
//        set the geometry of the node to the sphere we created
//        node.geometry = sphere
        
//        set the scene to the view
//        add the child node to the root node in the 3D scene
//        sceneView.scene.rootNode.addChildNode(node)
        
//        allow the scene to automatically adjust lighting for the cube
//        makes it more realistic
        sceneView.autoenablesDefaultLighting = true
        
        // Show statistics such as fps and timing information
//        sceneView.showsStatistics = true
        
        // Create a new scene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!

//        create a node to make a 3D position to place the nice
//        find the child node of the root node of the diceScene that is created with the diceCollada.scn
        
//        setting recursively to true makes the program search through all of the trees and subtrees of the nodes to find a child node with that identifier, as opposed to only the child nodes that are in the topmost level
//        in this case it is not really necessary, as the "Dice" node exists in the topmost level, but it is stil a good habit
        
//        diceNode is an optional, as it may not find a node with that name
        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {

//            set the position of the diceNode
            diceNode.position = SCNVector3(x: 0, y: 0, z: -0.1)
                    
//            add the child node to the root node in the 3D scene
            sceneView.scene.rootNode.addChildNode(diceNode)
            
        }
        
        
        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
