//
//  UIColor.swift
//  Test_SSUThing
//
//  Created by 최지우 on 2023/01/25.
//

import Foundation
import UIKit
import SnapKit

enum CustomColor {
    case green
    case sgray
    
}

extension UIColor {
    
    static func customColor(_ color: CustomColor) -> UIColor {
            switch color {
          
            case .sgray:
                return UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1.00)
            case .green:
                return UIColor(red: 0.34, green: 0.83, blue: 0.86, alpha: 1.00)

            }
        }
}
