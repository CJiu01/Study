//
//  UIColor+.swift
//  loginpractice
//
//  Created by 최지우 on 2023/01/26.
//

import Foundation
import UIKit
import SnapKit

enum CustomColor {
    case green
    case sgray
    case bgray
    case darkGray
    case maingreen
    case blue
    case boxGray
    case skyblue1
    case skyblue2
    case gray
}

extension UIColor {
    
    static func customColor(_ color: CustomColor) -> UIColor {
            switch color {
            case .bgray:
                return UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)
            case .darkGray:
                return UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1.00)
            case .sgray:
                return UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1.00)
            case .green:
                return UIColor(red: 0.34, green: 0.83, blue: 0.86, alpha: 1.00)
            case .maingreen:
                return UIColor(red: 0.41, green: 0.80, blue: 0.76, alpha: 1.00)
            case .blue:
                return UIColor(red: 0.00, green: 0.12, blue: 0.37, alpha: 1.00)
            case .gray:
                return UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
            case .darkGray:
                return UIColor(red:0.345, green:0.38, blue:0.467, alpha:1.00)
            case .boxGray:
                return UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1.00)
            case .skyblue1:
                return UIColor(red: 0.89, green: 0.95, blue: 1.00, alpha: 1.00)
            case .skyblue2:
                return UIColor(red: 0.69, green: 0.73, blue: 0.82, alpha: 1.00)
            case .green:
                return UIColor(red: 0.08, green: 0.58, blue: 0.00, alpha: 1.00)

            }
        }
}

