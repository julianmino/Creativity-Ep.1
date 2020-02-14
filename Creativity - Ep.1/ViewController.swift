//
//  ViewController.swift
//  Creativity - Ep.1
//
//  Created by Julian Mino on 03/12/2019.
//  Copyright © 2019 Julian Mino. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var colorSelector: UISegmentedControl!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var adder: UIStepper!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var insideLbl: UIView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var progressView: UIProgressView!
    let progress = Progress(totalUnitCount: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.minimumValue = 0
        slider.maximumValue = 255
        stepper.minimumValue = 0.0
        stepper.maximumValue = 100.0
        progressView.progress = 0.0
        progress.completedUnitCount = 0
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        
        switch colorSelector.selectedSegmentIndex {
            
        case 0: self.view.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        case 1: self.view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case 2: self.view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        case 3: self.view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        case 4: self.view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        default: break

        }
    }
    
    @IBAction func valueChanged(_ sender: UISlider) {
        
        let currentValue = sender.value
        self.view.backgroundColor = UIColor(red: 0, green: CGFloat(255.0/currentValue), blue: CGFloat(currentValue/255.0), alpha: 1.0)
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        
        let currentValue = sender.value
        progressView.progress = Float(currentValue)/100.0
        progress.completedUnitCount = Int64(currentValue)
        if (Int(currentValue)==100) {
            colorSelector.selectedSegmentIndex = 2
            indexChanged(colorSelector)
        } else {
            colorSelector.selectedSegmentIndex = 1
            indexChanged(colorSelector)
        }
    }
    
    
}

