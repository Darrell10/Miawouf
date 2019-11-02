//
//  CatFormViewController.swift
//  Miawouf
//
//  Created by Frederick Port on 26/10/2019.
//  Copyright © 2019 Frederick Port. All rights reserved.
//

import UIKit

class CatFormViewController: UIViewController {
    // MARK: - Property
    var cat: Pet!
    
    // MARK: - Outlets
    @IBOutlet weak var racePickerView: UIPickerView!
    @IBOutlet weak var hasMajoritySwitch: UISwitch!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!

}

// MARK: - Keyboard
extension CatFormViewController: UITextFieldDelegate {
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
    }
}

// MARK: - PickerView
extension CatFormViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return catRaces.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catRaces[row]
    }
}
 
// MARK: - Validate
extension CatFormViewController {
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
        cat = Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
    }
    
    private func checkPetStatus(){
        switch cat.status {
        case .accepted:
            performSegue(withIdentifier: "segueCatToSuccess", sender: self)
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
extension CatFormViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueCatToSuccess"{
            let successVC = segue.destination as! CatSuccessViewController
            successVC.cat = cat
        }
    }
}
