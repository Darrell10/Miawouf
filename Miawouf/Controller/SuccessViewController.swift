//
//  SuccessViewController.swift
//  Miawouf
//
//  Created by Frederick Port on 26/10/2019.
//  Copyright © 2019 Frederick Port. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {
    
    var dog: Pet!

    @IBOutlet weak var welcomeDogLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextLabel()
        // Do any additional setup after loading the view.
    }
    
    private func setTextLabel() {
        if let name = dog.name {
           welcomeDogLabel.text = """
            Wouf de bienvenue à  \(name) !

            Vous avez bien été ajouté à  notre base de donnée ! Nous vous enverrons un SMS dès que nous avons une âme soeur à vous proposer !
            """
        }
    }
    
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
