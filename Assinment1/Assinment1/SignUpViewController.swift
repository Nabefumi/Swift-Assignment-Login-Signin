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
    @IBOutlet weak var errorLabel: UILabel!
    
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
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    //Change textField color
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.green
    }
    
    //Otherwise WHITE
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
    }
        
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // maxLength
        var maxLength: Int = 0

        switch (textField.tag) {
            
        case 1: // Check to userNameTextField
            maxLength = 14
            if userNameTextField.text?.count ?? 0 <= 4 {
                userNameTextField.backgroundColor = UIColor.red
            } else {
                userNameTextField.backgroundColor = UIColor.green
            }
            
        case 2: // Check to emailTextField
            maxLength = 100
            
            if isValidMailAddress(self.emailTextField.text!) {
                errorLabel.text = "Correct email address"
            } else {
                errorLabel.text = "Please enter a valid email address."
            }
            
        case 3: // Check to passwordTextField
            maxLength = 16
            
            if passwordTextField.text?.count ?? 0 <= 6 {
                passwordTextField.backgroundColor = UIColor.red
            } else {
                passwordTextField.backgroundColor = UIColor.green
            }
            
        default:
            break
        }
        
        // Number of characters in the textField
        let textFieldNumber = textField.text?.count ?? 0
        // Number of characters entered
        let stringNumber = string.count

        return textFieldNumber + stringNumber <= maxLength
    }
    
    // Maile address determination
    func isValidMailAddress(_ string: String) -> Bool {
            let mailAddressRegEx = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            let mailAddressTest = NSPredicate(format:"SELF MATCHES %@", mailAddressRegEx)
            let result = mailAddressTest.evaluate(with: string)
            return result
     }
    
    // Screen transitions and value passing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nextVC = segue.destination as? toSigninViewController {
            
            nextVC.userNameValue = userNameTextField.text!
            nextVC.emailValue = emailTextField.text!
            nextVC.passwordValue = passwordTextField.text!
        }
    }
}
