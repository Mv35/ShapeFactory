//
//  ShapeView.swift
//  ShapeFactory
//
//  Created by Milo Volpicelli on 10/08/2022.
//  Copyright © 2022 Milo Volpicelli. All rights reserved.
//

import Foundation
import UIKit

class ShapeView: UIView {
    var shape: Shape!
    var color: UIColor!
    var tapHandler: ((ShapeView) -> ())?

    var parentView: UIView!
    let screenSize: CGRect = UIScreen.main.bounds

    override init(frame: CGRect) {

      super.init(frame: frame)
        
      let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
      addGestureRecognizer(tapRecognizer)
    }
    
    required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTap (_ sender: UITapGestureRecognizer? = nil) {
        //deselect previus selected shape
        let parentSublayers = self.parentView.layer.sublayers
        let subViews = self.parentView.subviews.filter{$0 is ShapeView}
        for sublayer in parentSublayers ?? [] where sublayer.isKind(of: CALayer.self) {
                sublayer.borderWidth = 0
        }
        
        //remove text from previous selected shape
        for subView in subViews {
            let subLayers = subView.layer.sublayers
            for sublayer in subLayers ?? [] where sublayer.isKind(of: CATextLayer.self) {
                    sublayer.removeFromSuperlayer()
            }
        }
        
        // handle new selection
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor.white.cgColor
        
        let label = CATextLayer()
        
        label.frame = CGRect(x: CGFloat(1.0), y: self.layer.bounds.midY * 0.75 , width: CGFloat(self.layer.bounds.width - 10), height: CGFloat(self.layer.bounds.height))
        
        label.string = "Position: \(NSString(format: "%.2f", self.shape.x)), \(NSString(format: "%.2f", self.shape.y))\nSize: \(NSString(format: "%.2f", self.shape.width)), \(NSString(format: "%.2f", self.shape.height))\nColor: \(self.shape.color.cgColor.components ?? [0.0,0.0,0.0,0.0])"
        
        label.isWrapped = true
        label.foregroundColor = UIColor.black.cgColor
        label.fontSize = self.layer.bounds.width / 16
        label.truncationMode = .middle
        label.alignmentMode = .center
        
        self.layer.addSublayer(label)
        
        self.parentView.bringSubviewToFront(self)

    }
    
    func configure(shape: Shape, parentView: UIView) {
        self.shape = shape
        self.parentView = parentView
        self.backgroundColor = self.shape.color
        self.color = self.shape.color ?? defaultColor
    }
    
    func position() {
        let position = CGPoint(x: CGFloat(Utils.randomBetweenLower(lower: self.shape.width/2, andUpper: self.parentView.layer.bounds.maxX - self.shape.width/2)),y: CGFloat(Utils.randomBetweenLower(lower: self.shape.height/2, andUpper: self.parentView.layer.bounds.maxY - self.shape.height/2)))
        
        self.shape.setPosition(point: position)
        self.center = position
    }
    
    func display() {
        configure(shape: self.shape, parentView: self.parentView)
        position()
        parentView.addSubview(self)
    }

}

class SquareView: ShapeView {
    
    
    override func configure(shape: Shape, parentView: UIView) {
        super.configure(shape: shape, parentView: parentView)
        let frame = CGRect(x: self.shape.x, y: self.shape.y, width: self.shape.width, height: self.shape.height)
        self.frame = frame
    }
} // end class Square

class CircleView : SquareView {
    
    override func configure(shape: Shape,parentView: UIView) {
        super.configure(shape: shape, parentView: parentView)
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true

    }
    
} // end class Circle

class RectangleView : SquareView {
} // end class Rectangle
