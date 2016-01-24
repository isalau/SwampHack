//
//  CAGradientClass.swift
//  DancinAroundTown
//
//  Created by Isabel Laurenceau on 1/23/16.
//  Copyright © 2016 Isabel Laurenceau. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    func pruplegradient() -> CAGradientLayer{
        let topColor = UIColor( red: (166/255.0), green: (31/255.0), blue: (204/255.0), alpha: 1)
        let bottomColor = UIColor( red: (214/255.0), green: (114/255.0), blue: (242/255.0), alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gradientLoactions: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLoactions
        
        //        gradientLayer.frame = self.view.bounds
        
        return gradientLayer
    }
}
