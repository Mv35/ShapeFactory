//
//  ViewController.swift
//  ShapeFactory
//
//  Created by Milo Volpicelli on 10/08/2022.
//  Copyright © 2022 Milo Volpicelli. All rights reserved.
//

import UIKit

extension ViewController {
    override var keyCommands: [UIKeyCommand]? {
        let infoCommand = UIKeyCommand(
                                   input: "c",
                                   modifierFlags: [],
                                   action: #selector(createShapes))

        return [infoCommand]
    }
}

class ViewController: UIViewController {
    var initialCenter = CGPoint()

    @objc private func createShapes() {
            let rangeOfShapes = 0...Int(Utils.randomBetweenLower(lower: 2, andUpper: 5))
            for shapeNumber in rangeOfShapes
            {
                let shapeId = shapeNumber % Shapes.allValues.count
                createShape(shapeId, on: view)
                
            }
        }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        addGesture()
        createShapes()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addGesture() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        view.addGestureRecognizer(pinchGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer){
        
        guard gestureRecognizer.view != nil else {return}
           let piece = gestureRecognizer.view!
           // Get the changes in the X and Y directions relative to
           // the superview's coordinate space.
           let translation = gestureRecognizer.translation(in: piece.superview)
           if gestureRecognizer.state == .began {
              // Save the view's original position.
              self.initialCenter = piece.center
           }
              // Update the position for the .began, .changed, and .ended states
           if gestureRecognizer.state != .cancelled {
              // Add the X and Y translation to the view's original position.
              let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
              piece.center = newCenter
           }
           else {
              // On cancellation, return the piece to its original location.
              piece.center = initialCenter
           }
        
    }
    
    @objc func handlePinch(_ gestureRecognizer: UIPinchGestureRecognizer){
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
           gestureRecognizer.view?.transform = (gestureRecognizer.view?.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale))!
           gestureRecognizer.scale = 1.0
        }
    }

} // end class ViewController


