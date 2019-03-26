//
//  ViewController.swift
//  BullsEye
//
//  Created by Carlos Eduardo on 23/03/19.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0

    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is now: \(currentValue)"
            + "\nThe target value is \(targetValue)"

        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(action)

        present(alert, animated: true, completion: nil)

        startNewRound()
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        print("The value of the slider is now: \(slider.value)")
        let roundedValue = slider.value.rounded()
        print("The rounded value of the slider is now: \(roundedValue)")
        currentValue = Int(roundedValue)
    }

    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
    }

}
