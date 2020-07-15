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
        
//        display a cloud of points as scene analysis is being done
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
//        Set the view's delegate
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
        
//        Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
//        Create a new scene
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
        
        
//        Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
//        set the plane of the configuration to horizontal
        configuration.planeDetection = .horizontal

//        Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        Pause the view's session
        sceneView.session.pause()
    }
    
//    when a touch is detected
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

//        since multi-touch is not enabled, we only want to retrieve the first touch
        if let touch = touches.first {
            
//            find the location of the touch in the coordinate system of the sceneView
            let touchLocation = touch.location(in: sceneView)
            
//            hitTest(_:types:) searches for real-world objects or AR anchors (in the image taken by the camera) corresponding to a point in the SceneKit view
//            the point we're looking for is the touchLocation point
            
//            "types" parameter refers to the type of hit-test result to search for
//            we are looking for a plane anchor already in the scene, taking into account the size of the plane (by adding "UsingExtent")
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
            
        }
        
    }
    
//    when a 3D object has been detected, and its dimensions are calculated (and represented in the form of an ARAnchor)
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
//        if the object detected is a plane
        if anchor is ARPlaneAnchor {
            
//            downcast the anchor into type ARPlaneAnchor
            let planeAnchor = anchor as! ARPlaneAnchor
            
//            create a plane in SceneKit
//            the extent property of the plane anchor is 2D (the y-value is always 0)
//            the only properties available in the extent property and x and z
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            
//            create a node for the plane
            let planeNode = SCNNode()
            
//            set the position of the node
//            center the node on the x-axis and z-axis
//            set the y-value to 0 as the plane is 2D
            planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.z)
            
//            as the plane is by default vertical, and we need to make it horizontal, we must rotate the plane 90 degrees
//            the "angle" parameter takes in radians, so we must convert 90 degrees to radians by dividing π by 2
//            as the rotation function rotates counter-clockwise, in order to rotate the plane clockwise, we must put a negative in front of the angle
            
//            we only want to rotate around the x-axis, and we don't care about the y-axis and the z-axis
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
            
//            create the material to go on to the grid
            let gridMaterial = SCNMaterial()
            
//            change the texture of the gridMaterial to the grid.png in the project
            gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
            
//            assign the material to the plane geometry created earlier
            plane.materials = [gridMaterial]
            
//            set the geometry of the planeNode to the plane we created
            planeNode.geometry = plane
            
//            add the node to the child node
            node.addChildNode(planeNode)
        
//        if the object detected is not a plane
        } else {
            
//            end the function's progression
            return
        }
        
    }
    
}
