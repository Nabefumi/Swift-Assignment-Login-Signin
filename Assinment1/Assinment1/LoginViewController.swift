//
//  LoginViewController.swift
//  Assinment1
//
//  Created by Takafumi Watanabe on 2021-10-05.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
            
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Rounded corners
        loginButton.layer.cornerRadius = 10.8
        
        emailTextField.delegate = self
        passwordTextField.delegate = self

    }
    
    @IBAction func login(_ sender: Any) {
        logoImage.image = UIImage(named: "loginOK")
        
        //Input-value check
        emailLabel.text = emailTextField.text
        passwordLabel.text = passwordTextField.text
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}


