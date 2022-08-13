//
//  ShapeFactory.swift
//  ShapeFactory
//
//  Created by Milo Volpicelli on 10/08/2022.
//  Copyright © 2022 Milo Volpicelli. All rights reserved.
//

import Foundation

import UIKit

let defaultHeight = Int(Utils.randomBetweenLower(lower: 10, andUpper: 300))
let defaultWidth = Int(Utils.randomBetweenLower(lower: 10, andUpper: 300))
let defaultColor = UIColor.blue

enum Shapes: Int {
    
    case square
    case circle
    case rectangle
    static var allValues = [square, circle, rectangle]
}

class ShapeViewFactory {
    
    let parentView: UIView
    
    init(parentView: UIView) {
        
        self.parentView = parentView
        
    }
    
    func create(rawValue: Int) -> ShapeView {
        let shape = Shapes(rawValue: rawValue)
        
        switch shape {
            
        case .square:
            let square = SquareView()
            let shape = SquareShape()
            square.configure(shape: shape, parentView: self.parentView)
            return square
            
        case .circle:
            let circle = CircleView()
            let shape = CircleShape()
            circle.configure(shape: shape, parentView: self.parentView)
            return circle
            
        case .rectangle:
            let rectangle = RectangleView()
            let shape = RectangleShape()
            rectangle.configure(shape: shape, parentView: self.parentView)
            return rectangle
        
        default:
            print("shape factory not configured correctly")
            return ShapeView()
        }
        
    } 
    
} // end class ShapeFactory

// Public factory method to display shapes.
func createShape(_ shapeInt: Int, on view: UIView) {
    
    let shapeFactory = ShapeViewFactory(parentView: view)
    shapeFactory.create(rawValue: shapeInt).display()
    
}

// Alternative public factory method to display shapes.
func getShape(_ shapeInt: Int, on view: UIView) -> ShapeView {
    
    let shapeFactory = ShapeViewFactory(parentView: view)
    return shapeFactory.create(rawValue: shapeInt)
}
