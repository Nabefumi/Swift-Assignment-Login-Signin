//
//  WelcomeViewController.swift
//  Assinment1
//
//  Created by Takafumi Watanabe on 2021-10-06.
//

import UIKit

class toLoginViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var emailValue: String?
    var passwordValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailLabel.text = emailValue
        passwordLabel.text = passwordValue
    }
}
