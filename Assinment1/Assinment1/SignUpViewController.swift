//
//  SignUpViewController.swift
//  Assinment1
//
//  Created by Takafumi Watanabe on 2021-10-05.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
                
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Rounded corners
        signupButton.layer.cornerRadius = 10.8
        
        userNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self

    }
    
    @IBAction func signup(_ sender: Any) {
        logoImage.image = UIImage(named: "loginOK")
        
        //Input-value check
        userNameLabel.text = userNameTextField.text
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
