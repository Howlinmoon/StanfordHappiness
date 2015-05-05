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
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            // Implementing a 'Pinch' handler to adjust the scale of the face
            // this is called by the view when it detects a pinch
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    // Handle the panning up and down on the face view with this
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
        
    }

    func updateUI() {
        faceView.setNeedsDisplay()
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50)/50
    }

}
