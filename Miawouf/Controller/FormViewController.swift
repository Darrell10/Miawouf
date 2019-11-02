//
//  FormViewController.swift
//  Miawouf
//
//  Created by Frederick Port on 26/10/2019.
//  Copyright © 2019 Frederick Port. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    // MARK: - Property
    var dog: Pet!
    
    // MARK: - Outlets
    @IBOutlet weak var racePickerView: UIPickerView!
    @IBOutlet weak var hasMajoritySwitch: UISwitch!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
}
// MARK: - Keyboard
extension FormViewController: UITextFieldDelegate {
    @IBAction func dsimissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - PickerView
extension FormViewController: UIPickerViewDelegate, UIPickerViewDataSource{
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return dogRaces.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return dogRaces[row]
        }
}

// MARK: - Validate
extension FormViewController {
    @IBAction func validate() {
        createPetObject()
        checkPetStatus()
    }
    
    private func createPetObject(){
        let name = nameTextField.text
        let phone = phoneTextField.text
        let hasMajority = hasMajoritySwitch.isOn
        let genderIndex = genderSegmentedControl.selectedSegmentIndex
        let gender: Pet.Gender = (genderIndex == 0) ? .male : .female
        let raceIndex = racePickerView.selectedRow(inComponent: 0)
        let race = dogRaces[raceIndex]
        dog = Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
    }
    
    private func checkPetStatus(){
        switch dog.status {
        case .accepted:
            performSegue(withIdentifier: "segueToSuccess", sender: self)
        case .rejected(let error):
            presentAlert(with: error)
        }
    }
    
    private func presentAlert(with error: String){
        let alertVC = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
}

// MARK: - Navigation
extension FormViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSuccess"{
            let successVC = segue.destination as! SuccessViewController
            successVC.dog = dog
        }
    }
}
