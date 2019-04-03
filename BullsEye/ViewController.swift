//
//  ViewController.swift
//  BullsEye
//
//  Created by Carlos Eduardo on 23/03/19.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewGame()
    }

    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        var bonus = false
        var extraScore = 0

        score += points

        let title: String
        if difference == 0 {
            title = "Perfect!"
            bonus = true
            extraScore = 100
        } else if difference < 5 {
            if difference == 1 {
                extraScore = 50
                bonus = true
            }
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }

        var message = "You scored \(points) points"
        if bonus {
            score += extraScore
            message += "\nAnd an extra score of \(extraScore)"
        }

        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
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
        round += 1
        updateLabels()
    }

    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }

}
