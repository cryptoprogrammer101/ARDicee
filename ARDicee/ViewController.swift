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
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
//        create the material to go on the cube
        let material = SCNMaterial()
        
//        set the color of the cube to blue
        material.diffuse.contents = UIColor.blue
        
//        pass in the material to the cube
        cube.materials = [material]
        
//        create a node
//        a node is a point in 3D space, representing position and transform
        let node = SCNNode()
        
//        declare the position of the node
//        SCNVector3 is a 3D vector that has an x-position, y-position, and z-position
//        set the x-position to be 0, set the y-position to be 0.1 (raising the cube up 10 cm), and push the cube away from the user by setting the z-position to a negative number (-0.5 -> 50 cm in front)
//        +z -> towards the user, -z -> away from the user
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        
//        set the geometry of the node to the cube we created
        node.geometry = cube
        
//        set the scene to the view
//        add the child node to the root node in the 3D scene
        sceneView.scene.rootNode.addChildNode(node)
        
//        allow the scene to automatically adjust lighting for the cube
//        makes it more realistic
        sceneView.autoenablesDefaultLighting = true
        
        // Show statistics such as fps and timing information
//        sceneView.showsStatistics = true
        
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
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
