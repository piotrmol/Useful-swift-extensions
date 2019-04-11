//
//  ColorExtension.swift
//  GISMO
//
//  Created by Piotr Mol on 26.11.2018.
//  Copyright © 2018 Piotr Mol. All rights reserved.
//

import Foundation
import Freddy


extension UIColor
{
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return NSString(format:"#%06x", rgb) as String
    }
    
    static func jsonRGBAtoUIColor(jsonColor: [JSON]) -> UIColor{
        do {
          let red = try jsonColor[0].getInt()
          let green = try jsonColor[1].getInt()
          let blue = try jsonColor[2].getInt()
          let alpha = try jsonColor[3].getInt()
            
            let color = UIColor(displayP3Red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue) ,alpha: CGFloat((alpha * 100) / 255))
            return color
        } catch {
            return UIColor.white
        }
    }
}


