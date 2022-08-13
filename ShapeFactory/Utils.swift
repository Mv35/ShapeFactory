//
//  Utils.swift
//  ShapeFactory
//
//  Created by Milo Volpicelli on 10/08/2022.
//  Copyright © 2022 Milo Volpicelli. All rights reserved.
//

import Foundation
import UIKit

class Utils {
  class func randomBetweenLower(lower: CGFloat, andUpper: CGFloat) -> CGFloat {
    return lower + CGFloat(arc4random_uniform(101)) / 100.0 * (andUpper - lower)
  }
}
