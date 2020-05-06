//
//  ViewController.swift
//  Caloriemeter
//
//  Created by Azar Aliyev on 19/03/2020.
//  Copyright © 2020 Azar Aliyev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var gainWeightButton: UIButton!
    
    @IBOutlet weak var looseWeightButton: UIButton!
    
    @IBOutlet weak var maintainWeightButton: UIButton!
    
    var choice = Choice()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gainWeightButton.backgroundColor = .clear
        gainWeightButton.layer.cornerRadius = 30
        gainWeightButton.layer.borderWidth = 2
        gainWeightButton.layer.borderColor = UIColor(red:0.23, green:0.31, blue:0.11, alpha:1.00).cgColor
        gainWeightButton.isHighlighted = false
        gainWeightButton.backgroundColor = nil
        
        looseWeightButton.backgroundColor = .clear
        looseWeightButton.layer.cornerRadius = 30
        looseWeightButton.layer.borderWidth = 2
        looseWeightButton.layer.borderColor = UIColor(red:0.23, green:0.31, blue:0.11, alpha:1.00).cgColor
        looseWeightButton.isHighlighted = false
        looseWeightButton.backgroundColor = nil
        
        maintainWeightButton.backgroundColor = .clear
        maintainWeightButton.layer.cornerRadius = 30
        maintainWeightButton.layer.borderWidth = 2
        maintainWeightButton.layer.borderColor = UIColor(red:0.23, green:0.31, blue:0.11, alpha:1.00).cgColor
        maintainWeightButton.isHighlighted = false
        maintainWeightButton.backgroundColor = nil  
    }

    
    @IBAction func gainWeightPressed(_ sender: UIButton) {
        looseWeightButton.layer.borderWidth = 2
        looseWeightButton.isHighlighted = false
        looseWeightButton.backgroundColor = nil
        maintainWeightButton.layer.borderWidth = 2
        maintainWeightButton.isHighlighted = false
        maintainWeightButton.backgroundColor = nil
        sender.layer.borderWidth = 0
        sender.backgroundColor = UIColor(red:0.41, green:0.61, blue:0.22, alpha:0.3)
        let delay : Double = 0.7
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {

            sender.layer.borderWidth = 2
            sender.isHighlighted = false
            sender.backgroundColor = nil

        }
        
        
        choice.selectedChoice = sender.titleLabel?.text ?? ""
        performSegue(withIdentifier: Strings.segueToDetailVC, sender: self)
    }
    
    @IBAction func loseWeightPressed(_ sender: UIButton) {
        gainWeightButton.layer.borderWidth = 2
        gainWeightButton.isHighlighted = false
        gainWeightButton.backgroundColor = nil
        maintainWeightButton.layer.borderWidth = 2
        maintainWeightButton.isHighlighted = false
        maintainWeightButton.backgroundColor = nil
        sender.layer.borderWidth = 0
        sender.backgroundColor = UIColor(red:0.41, green:0.61, blue:0.22, alpha:0.3)
        let delay : Double = 0.7
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {

            sender.layer.borderWidth = 2
            sender.isHighlighted = false
            sender.backgroundColor = nil

        }
        
        choice.selectedChoice = sender.titleLabel?.text ?? ""
        performSegue(withIdentifier: Strings.segueToDetailVC, sender: self)
    }
    
    
    @IBAction func maintainWeightPressed(_ sender: UIButton) {
        looseWeightButton.layer.borderWidth = 2
        looseWeightButton.isHighlighted = false
        looseWeightButton.backgroundColor = nil
        gainWeightButton.layer.borderWidth = 2
        gainWeightButton.isHighlighted = false
        gainWeightButton.backgroundColor = nil
        sender.layer.borderWidth = 0
        sender.backgroundColor = UIColor(red:0.41, green:0.61, blue:0.22, alpha:0.3)
        let delay : Double = 0.7
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {

            sender.layer.borderWidth = 2
            sender.isHighlighted = false
            sender.backgroundColor = nil

        }
        
        choice.selectedChoice = sender.titleLabel?.text ?? ""
        
        performSegue(withIdentifier: Strings.segueToDetailVC, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController {
            detailVC.choice = choice
        }
    }
    
}

