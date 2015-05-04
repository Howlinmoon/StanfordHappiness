//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Jim Veneskey on 5/2/15.
//  Copyright (c) 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController {

    var happiness: Int = 50 { // 0 = very sad, 100 = ecstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            updateUI()
            println("Happiness = \(happiness)")
        }
        
    }

    func updateUI() {
        
    }
    

}
