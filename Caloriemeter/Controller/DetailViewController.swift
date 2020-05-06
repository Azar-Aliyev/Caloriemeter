//
//  DetailViewController.swift
//  Caloriemeter
//
//  Created by Azar Aliyev on 20/03/2020.
//  Copyright © 2020 Azar Aliyev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    var choice = Choice()
    var data = Data()
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var genderChoice: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ageTextField.delegate = self
        heightTextField.delegate = self
        weightTextField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView.setValue(UIColor(red:0.81, green:0.39, blue:0.19, alpha:1.00), forKey: "textColor")
        ageTextField.backgroundColor = .clear
        ageTextField.layer.cornerRadius = 15
        ageTextField.layer.borderWidth = 2
        ageTextField.layer.borderColor = UIColor(red:0.81, green:0.39, blue:0.19, alpha:1.00).cgColor
        
        heightTextField.backgroundColor = .clear
        heightTextField.layer.cornerRadius = 15
        heightTextField.layer.borderWidth = 2
        heightTextField.layer.borderColor = UIColor(red:0.81, green:0.39, blue:0.19, alpha:1.00).cgColor
        
        weightTextField.backgroundColor = .clear
        weightTextField.layer.cornerRadius = 15
        weightTextField.layer.borderWidth = 2
        weightTextField.layer.borderColor = UIColor(red:0.81, green:0.39, blue:0.19, alpha:1.00).cgColor
        
        calculateButton.backgroundColor = UIColor(red:0.81, green:0.39, blue:0.19, alpha:1.00)
        calculateButton.layer.cornerRadius = 21
        
        calculateButton.isEnabled = false
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        data.gender = genderChoice.titleForSegment(at: genderChoice.selectedSegmentIndex)!
        
        performSegue(withIdentifier: Strings.segueToResultVC, sender: self)
    }
    
    
    @IBAction func ageFieldDidEndEditing(_ sender: UITextField) {
        updateCalculateButton()
    }
    
    @IBAction func heightFieldDidEndEditing(_ sender: UITextField) {
        updateCalculateButton()
    }
    @IBAction func WeightFieldDidEndEditing(_ sender: UITextField) {
        updateCalculateButton()
    }
    
    
    @IBAction func genderValueChanged(_ sender: UISegmentedControl) {
        ageTextField.endEditing(true)
        heightTextField.endEditing(true)
        weightTextField.endEditing(true)
    }
    
    func updateCalculateButton(){
        if ageTextField.text != "" && heightTextField.text != "" && weightTextField.text != "" {
            calculateButton.isEnabled = true
            
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultVC = segue.destination as? ResultViewController{
            resultVC.data = data
            resultVC.choice = choice
        }
    }
}

extension DetailViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ageTextField.endEditing(true)
        heightTextField.endEditing(true)
        weightTextField.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text{
            if textField.placeholder == ageTextField.placeholder! {
                data.age = text
            }
            else if textField.placeholder == heightTextField.placeholder! {
                data.height = text
            }
            else if textField.placeholder == weightTextField.placeholder! {
                data.weight = text
            }
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 8
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
}

extension DetailViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data.array[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        data.activity = data.array[row]
        data.selectedRow = Double(row)
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        var label: UILabel
        if let view = view as? UILabel { label = view }
        else { label = UILabel() }

        label.text = data.array[row]
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = UIColor(red: 0.81, green: 0.39, blue: 0.19, alpha: 1.00)
        return label
    }
}
