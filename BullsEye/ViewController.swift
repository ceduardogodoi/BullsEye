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

    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is now: \(currentValue)"

        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        print("The value of the slider is now: \(slider.value)")
        let roundedValue = slider.value.rounded()
        print("The rounded value of the slider is now: \(roundedValue)")
        currentValue = Int(roundedValue)
    }

}
