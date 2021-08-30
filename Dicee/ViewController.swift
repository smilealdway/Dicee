//
//  ViewController.swift
//  Dicee
//
//  Created by Katie McBratney on 8/30/21.
//

import Foundation
import SwiftUI

final class ViewController: UIViewController {
    var counter = 0
    var timer = Timer()
    
    func rollDice() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(rollDice), userInfo: nil, repeats: true)
    }
}
