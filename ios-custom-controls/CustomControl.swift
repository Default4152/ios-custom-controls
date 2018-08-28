//
//  CustomControl.swift
//  ios-custom-controls
//
//  Created by Conner on 8/28/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
  required init?(coder aCoder: NSCoder) {
    super.init(coder: aCoder)
    setup()
  }
  
  var value: Int = 1
  
  private let componentDimension: CGFloat = 40.0
  private let componentCount = 5
  private let componentActiveColor = UIColor.black
  private let componentInactiveColor = UIColor.gray
  
  func setup() {
    let labels = [UILabel(frame: CGRect(x: 0,
                                        y: 0,
                                        width: componentDimension,
                                        height: componentDimension)),
                  UILabel(frame: CGRect(x: 27.0,
                                        y: 0,
                                        width: componentDimension,
                                        height: componentDimension)),
                  UILabel(frame: CGRect(x: 55.0,
                                        y: 0,
                                        width: componentDimension,
                                        height: componentDimension)),
                  UILabel(frame: CGRect(x: 83.0,
                                        y: 0,
                                        width: componentDimension,
                                        height: componentDimension)),
                  UILabel(frame: CGRect(x: 111.0,
                                        y: 0,
                                        width: componentDimension,
                                        height: componentDimension))]
    
    for (i, label) in labels.enumerated() {
      label.text = "★"
      label.tag = i
      label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
      
      if (i == 0) {
        label.textColor = componentActiveColor
      } else {
        label.textColor = componentInactiveColor
      }
      
      self.addSubview(label)
    }
  }
  
  override var intrinsicContentSize: CGSize {
    let componentsWidth = CGFloat(componentCount) * componentDimension
    let componentsSpacing = CGFloat(componentCount + 1) * 8.0
    let width = componentsWidth + componentsSpacing
    return CGSize(width: width, height: componentDimension)
  }
  
}
