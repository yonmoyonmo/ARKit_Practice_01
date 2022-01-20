//
//  ViewController.swift
//  AR_Practice01
//
//  Created by yonmo on 2022/01/17.
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
        
        let text = SCNText(string: "hello ar kit", extrusionDepth: 1)
        let text2 = SCNText(string: "seconde text", extrusionDepth: 1)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.systemBlue
        text.materials = [material]
        text2.materials = [material]
        
        let node = SCNNode()
        node.position = SCNVector3(x: 0, y: 0.02, z: -3)
        node.scale = SCNVector3(x: 0.01, y: 0.01, z: 0.01)
        node.geometry = text
        
        let node2 = SCNNode()
        node2.position = SCNVector3(x: 0, y: 1, z: -3)
        node2.scale = SCNVector3(x: 0.01, y: 0.01, z: 0.01)
        node2.geometry = text2
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.scene.rootNode.addChildNode(node2)
        sceneView.autoenablesDefaultLighting = true
//
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

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
