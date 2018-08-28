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
  private var labels: [UILabel] = []
  
  func setup() {
    for i in 0..<componentCount {
      let label = UILabel(frame: CGRect(x: (componentDimension + 8) * CGFloat(i),
                                        y: 0,
                                        width: componentDimension,
                                        height: componentDimension))
      label.text = "★"
      label.tag = i
      label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
      
      if (i == 0) {
        label.textColor = componentActiveColor
      } else {
        label.textColor = componentInactiveColor
      }
      
      label.textAlignment = .center
      
      self.addSubview(label)
      labels.append(label)
    }
  }
  
  override var intrinsicContentSize: CGSize {
    let componentsWidth = CGFloat(componentCount) * componentDimension
    let componentsSpacing = CGFloat(componentCount + 1) * 8.0
    let width = componentsWidth + componentsSpacing
    return CGSize(width: width, height: componentDimension)
  }
  
  func updateValue(at touch: UITouch) {
    let touchPoint = touch.location(in: self)
    for (i, _) in labels.enumerated() {
      if touchPoint.x >= labels[i].frame.minX {
        value = i + 1
        labels[i].textColor = componentActiveColor
        sendActions(for: .valueChanged)
      } else {
        labels[i].textColor = componentInactiveColor
      }
    }
  }
  
  override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    updateValue(at: touch)
    return true
  }
  
  override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    let touchPoint = touch.location(in: self)
    if bounds.contains(touchPoint) {
      updateValue(at: touch)
      sendActions(for: .touchDragInside)
    } else {
      sendActions(for: .touchDragOutside)
    }
    return true
  }
  
  override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
    guard let touch = touch else { return }
    let touchPoint = touch.location(in: self)
    if bounds.contains(touchPoint) {
      updateValue(at: touch)
      sendActions(for: .touchUpInside)
    } else {
      sendActions(for: .touchUpOutside)
    }
  }
  
  override func cancelTracking(with event: UIEvent?) {
    sendActions(for: .touchCancel)
  }
  
}

extension UIView {
  // "Flare view" animation sequence
  func performFlare() {
    func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
    func unflare() { transform = .identity }
    
    UIView.animate(withDuration: 0.3,
                   animations: { flare() },
                   completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
  }
}
