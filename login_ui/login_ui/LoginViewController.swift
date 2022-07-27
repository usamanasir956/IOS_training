//
//  ViewController.swift
//  login_ui
//
//  Created by Dev on 15/07/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var email_text_field: UITextField!
    @IBOutlet weak var password_text_field: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signInWithGoogle(_ sender: Any) {
        
        print("Login With Google")

    }
    
    @IBAction func signIn(_ sender: Any) {
        print("Sign in")
        if !(email_text_field.text!.isEmpty), !password_text_field.text!.isEmpty{
            print("Login with \(email_text_field.text!) \(password_text_field.text!)")
        }
        else{
            print("Fill Out email and passwordß")
        }
    }
    
    
    @IBAction func forgotPassword(_ sender: Any) {
        print("email has been send")
    }
    
}

