//
//  ViewController.swift
//  Assinment1
//
//  Created by Takafumi Watanabe on 2021-10-05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Rounded corners
        logInButton.layer.cornerRadius = 10.8
        signUpButton.layer.cornerRadius = 10.8

    }
    
    @IBAction func login(_ sender: Any) {
        self.performSegue(withIdentifier: "loginSegue", sender: self)
    }
    
    @IBAction func signin(_ sender: Any) {
        self.performSegue(withIdentifier: "signupSegue", sender: self)
    }
    

}

