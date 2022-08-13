//
//  Shape.swift
//  ShapeFactory
//
//  Created by Milo Volpicelli on 10/08/2022.
//  Copyright © 2022 Milo Volpicelli. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func random(from colors: [UIColor]) -> UIColor? {
        return colors.randomElement()
    }
}

class Shape {
  var height: CGFloat
  var width: CGFloat
  var x: CGFloat!
  var y: CGFloat!
  var color: UIColor!
  var area: CGFloat { return 0 }
  init(){
    self.height = CGFloat(Utils.randomBetweenLower(lower: 100, andUpper: 300))
    self.width = CGFloat(Utils.randomBetweenLower(lower: 100, andUpper: 300))
    self.x = 0.0
    self.y = 0.0
    self.color = UIColor.random(from: [.red, .yellow, .green, .blue, .purple, .orange, .brown, .lightGray, .cyan])
  }
  
  func setPosition(point: CGPoint){
      self.x = point.x
      self.y = point.y
  }
}

class SquareShape: Shape {
  override init() {
    super.init()
    self.height = self.width
  }
    
  override var area: CGFloat { return self.height * self.width }
}

class CircleShape: SquareShape {
    override var area: CGFloat { return CGFloat(Double.pi) * self.height * self.height }
}

class RectangleShape: SquareShape {
    override init() {
        super.init()
        self.width = self.height + self.height/2
    }
}
