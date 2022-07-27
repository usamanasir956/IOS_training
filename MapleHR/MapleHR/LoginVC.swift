//
//  LoginVC.swift
//  MapleHR
//
//  Created by Dev on 15/07/2022.
//

import UIKit

class LoginVC: UIViewController {

    
    fileprivate var api = Api()
    
    @IBOutlet weak var email_text_field: UITextField!
    @IBOutlet weak var password_text_field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    @IBAction func signInWithGoogle(_ sender: Any) {
        
        print("Login With Google")

    }
    
    @IBAction func signIn(_ sender: Any) {
        if !(email_text_field.text!.isEmpty), !password_text_field.text!.isEmpty{
            print("Login with \(email_text_field.text!) \(password_text_field.text!)")
            api.login(email: email_text_field.text!, password: "") { user, err in
                if let current_user = user {
                    print("Signed in \(current_user.data.id) \(current_user.data.name) \(current_user.data.email)")
                    toHome(user: current_user.data)
                }
                else{
                    print("User Not Found")
                }
                print("Some Response Recieved")
            }
        }
        else{
            print("Fill Out email and passwordß")
        }
        
        
    }
    
    
    @IBAction func forgotPassword(_ sender: Any) {
        print("email has been send")
    }
    
    func toHome(user :User) {
        
        //Get VC and assign data
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVCIdSample") as! HomeVC
        vc.user = user
        
        //Replace VC
        self.present(vc, animated: true, completion: nil)
//        self.navigationController?.pushViewController(vc, animated: true)
    
    }

}

