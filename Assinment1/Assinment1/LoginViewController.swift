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
    @IBOutlet weak var errorLabel: UILabel!
    
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
            
        case 1: // Check to emailTextField
            maxLength = 100
            
            if isValidMailAddress(self.emailTextField.text!) {
                errorLabel.text = "Correct email address"
            } else {
                errorLabel.text = "Please enter a valid email address."
            }
            
        case 2: // Check to passwordTextField
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
        
        if let nextVC = segue.destination as? toLoginViewController {
            nextVC.emailValue = emailTextField.text!
            nextVC.passwordValue = passwordTextField.text!
        }
        
    }
}


