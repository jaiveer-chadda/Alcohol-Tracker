//
//  ColourExtension.swift
//  Alcohol Tracker
//
//  Created by Jaiveer Chadda on 17/10/2025.
//

import SwiftUI
import Foundation


public extension UIColor {
    convenience init(r: Int, g: Int, b: Int, a: CGFloat) {
        let (red, green, blue) = Self.getCGFloatAll(r: r, g: g, b: b)
        self.init(red: red, green: green, blue: blue, alpha: a)
    }
    
    convenience init(_ r: Int, _  g: Int, _ b: Int) {
        let (red, green, blue) = Self.getCGFloatAll(r: r, g: g, b: b)
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    convenience init(gray: Int) {
        let _gray = Self.getCGFloat(gray)
        self.init(red: _gray, green: _gray, blue: _gray, alpha: 1)
    }
    
    convenience init(hexValue: UInt, alpha: CGFloat = 1.0) {
        let (red, green, blue) = Self.rgbFrom(hexValue: hexValue)
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init(hexValue: UInt) {
        let (red, green, blue) = Self.rgbFrom(hexValue: hexValue)
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    class func rgbFrom(hexValue: UInt) -> (CGFloat, CGFloat, CGFloat) {
        let red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hexValue & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(hexValue & 0xFF) / 255.0
        return (red, green, blue)
    }
    
    class func getCGFloat(_ colorValue: Int) -> CGFloat {
        return CGFloat(colorValue)/255.0
    }
    
    class func getCGFloatAll(r: Int, g: Int, b: Int) -> (CGFloat, CGFloat, CGFloat) {
        return (
            Self.getCGFloat(r),
            Self.getCGFloat(g),
            Self.getCGFloat(b)
        )
    }
}
