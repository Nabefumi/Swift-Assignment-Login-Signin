//
//  toSigninViewController.swift
//  Assinment1
//
//  Created by Takafumi Watanabe on 2021-10-06.
//

import UIKit

class toSigninViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var userNameValue: String?
    var emailValue: String?
    var passwordValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = userNameValue
        emailLabel.text = emailValue
        passwordLabel.text = passwordValue

    }

}
