//
//  UIView.swift
//  seatsApp
//
//  Created by Carlos Henrique Antunes on 2/29/20.
//  Copyright © 2020 Carlos Henrique Antunes. All rights reserved.
//

import UIKit

extension UIView {
  func roundCornersWithBorders(corners: UIRectCorner, radius: CGFloat, borderColor: CGColor, width: CGFloat) {
    
    DispatchQueue.main.async {
      let path = UIBezierPath(roundedRect: self.bounds,
                              byRoundingCorners: corners,
                              cornerRadii: CGSize(width: radius, height: radius))
      let maskLayer = CAShapeLayer()
      maskLayer.frame = self.bounds
      maskLayer.path = path.cgPath
      self.layer.mask = maskLayer
      
      let borderLayer = CAShapeLayer()
      borderLayer.path = maskLayer.path
      borderLayer.fillColor = UIColor.clear.cgColor
      borderLayer.strokeColor = borderColor
      borderLayer.lineWidth = width
      borderLayer.frame = self.bounds
      self.layer.addSublayer(borderLayer)
    }
  }
  
}
