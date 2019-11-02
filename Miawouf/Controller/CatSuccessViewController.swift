//
//  CatSuccessViewController.swift
//  Miawouf
//
//  Created by Frederick Port on 26/10/2019.
//  Copyright © 2019 Frederick Port. All rights reserved.
//

import UIKit

class CatSuccessViewController: UIViewController {
    var cat: Pet!

    @IBOutlet weak var welcomeCatLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextLabel()

        // Do any additional setup after loading the view.
    }
    
    private func setTextLabel() {
        if let name = cat.name {
           welcomeCatLabel.text = """
            Miaou de bienvenue à  \(name) !

            Vous avez bien été ajouté à  notre base de donnée ! Nous vous enverrons un SMS dès que nous avons une âme soeur à vous proposer !
            """
        }
    }
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
