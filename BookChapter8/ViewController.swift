//
//  ViewController.swift
//  BookChapter8
//
//  Created by MD Tanvir Alam on 18/2/21.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var stepperValue: UIStepper!
    @IBOutlet weak var stepperButton: UIButton!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressVIewStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepperLabel.text = "\(stepperValue.value)"
        stepperButton.setTitle("ChangeButton", for: UIControl.State.normal)
        activityIndicator.hidesWhenStopped = true
        
        progressView.progress = 0
        progressVIewStepper.minimumValue = 0
        progressVIewStepper.stepValue = 0.1
        progressVIewStepper.maximumValue = 1.0
    }
    
    
    @IBAction func progressViewStepperChanged(_ sender: UIStepper) {
        let value = progressVIewStepper.value * 10.0
        let roundedValue = value.rounded()
        let finalValue = Int(roundedValue)
        progressLabel.text = "Completed \(finalValue) of 10 tasks"
        progressView.progress = Float(progressVIewStepper.value)
    }
    
    @IBAction func stepperChanged(_ sender: Any) {
        stepperLabel.text = "\(stepperValue.value)"
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        sliderLabel.text = "\(sliderValue.value)"
    }
    
    @IBAction func activityIndicatorButton(_ sender: UIButton) {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.activityIndicator.startAnimating()
            self.counter += 1
            
            if self.counter >= 5{
                self.activityIndicator.stopAnimating()
                timer.invalidate()
                self.counter = 0
            }
        }
    }
    @IBAction func changeSlider(_ sender: UIButton) {
        sliderValue.minimumValue = 1
        sliderValue.maximumValue = 25
        sliderValue.value = 7
        sliderValue.minimumTrackTintColor = UIColor.red
        sliderValue.maximumTrackTintColor = UIColor.green
        sliderValue.thumbTintColor = UIColor.black
    }
    
    @IBAction func changeSteppeBtnClicked(_ sender: UIButton) {
        stepperValue.minimumValue = -10
        stepperValue.maximumValue = -5
        stepperValue.stepValue = 0.5
        stepperValue.isContinuous = true
        stepperValue.autorepeat = true
        stepperValue.wraps = true
    }
    
}

