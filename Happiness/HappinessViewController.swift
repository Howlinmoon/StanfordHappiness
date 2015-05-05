//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Jim Veneskey on 5/2/15.
//  Copyright (c) 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {

    var happiness: Int = 25 { // 0 = very sad, 100 = ecstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            updateUI()
            println("Happiness = \(happiness)")
        }
        
    }

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            // Implementing a 'Pinch' handler to adjust the scale of the face
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    

    func updateUI() {
        faceView.setNeedsDisplay()
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50)/50
    }

}
