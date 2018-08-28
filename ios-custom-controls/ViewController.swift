//
//  ViewController.swift
//  ios-custom-controls
//
//  Created by Conner on 8/28/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBAction func updateRating(_ ratingControl: CustomControl) {
    if ratingControl.value == 0 {
      title = "User Rating: \(ratingControl.value+1) star"
    } else {
      title = "User Rating: \(ratingControl.value+1) stars"
    }
  }
}

