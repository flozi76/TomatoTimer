//
//  ViewController.swift
//  TomatoTimer
//
//  Created by Florian Zimmermann on 06.11.17.
//  Copyright © 2017 Florian Zimmermann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var rotateMotion : Bool = true
    
    @IBOutlet weak var tomatoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        tomatoImage.isUserInteractionEnabled = true
        tomatoImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        if rotateMotion {
            rotateView(targetView: tappedImage, duration: 15)
        }
        
        rotateMotion = !rotateMotion
    }
    
    private func rotateView(targetView: UIView, duration: Double = 1.0) {
        if !rotateMotion {
            return
        }
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: CGFloat(Double.pi))
        })
        { finished in
            self.rotateView(targetView: targetView, duration: duration)
        }
    }


}

