//
//  CatFormViewController.swift
//  Miawouf
//
//  Created by Frederick Port on 26/10/2019.
//  Copyright © 2019 Frederick Port. All rights reserved.
//

import UIKit

class CatFormViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var racePickerView: UIPickerView!
    @IBOutlet weak var hasMajoritySwitch: UISwitch!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return catRaces.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catRaces[row]
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    private func createPetObject(){
        let name = nameTextField.text
        let phone = phoneTextField.text
        let hasMajority = hasMajoritySwitch.isOn
        let genderIndex = genderSegmentedControl.selectedSegmentIndex
        let gender: Pet.Gender = (genderIndex == 0) ? .male : .female
        let raceIndex = racePickerView.selectedRow(inComponent: 0)
        let race = dogRaces[raceIndex]
        let cat = Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
        print(cat)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
    
    @IBAction func validate() {
        createPetObject()
    }
 
}
