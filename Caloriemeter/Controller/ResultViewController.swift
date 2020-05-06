//
//  ResultViewController.swift
//  Caloriemeter
//
//  Created by Azar Aliyev on 30/03/2020.
//  Copyright © 2020 Azar Aliyev. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController{
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var varyingLabel: UILabel!
    var bmr: Double = 0.0
    var data = Data()
    var choice = Choice()
    override func viewDidLoad() {
        homeButton.backgroundColor = UIColor(red:0.23, green:0.31, blue:0.11, alpha:1.00)
        homeButton.layer.cornerRadius = 20
        if data.gender == Strings.genderMale {
            if let weight = Double(data.weight), let height = Double(data.height), let age = Double(data.age) {
                bmr = 10 * weight + 6.25 * height - 5 * age + 5
            }
            else{
                print("error")
            }
        }
        else {
            if let weight = Double(data.weight), let height = Double(data.height), let age = Double(data.age) {
                bmr = 10 * weight + 6.25 * height - 5 * age - 161
            }
            else{
                print("error")
            }
        }
        
        bmr = bmr * (1.2 + 0.125 * data.selectedRow)
        
        if choice.selectedChoice == Strings.selectedChoiceGain{
            resultLabel.text = String(format:"%.0f", bmr+500.0)
            varyingLabel.text = Strings.varyingLabelGain
        }
        else if choice.selectedChoice == Strings.selectedChoiceLose{
            resultLabel.text = String(format:"%.0f", bmr-500.0)
            varyingLabel.text = Strings.varyingLabelLose
        }
        else {
            resultLabel.text = String(format:"%.0f", bmr)
            varyingLabel.text = Strings.varyingLabelMaintain
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

