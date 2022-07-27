//
//  SixViewController.swift
//  navigation
//
//  Created by Dev on 25/07/2022.
//

import UIKit

class SixViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextScreen(_ sender: Any) {
//        self.navigationController?.popViewController(animated: true)
//        self.navigationController?.popToRootViewController(animated: true)
        
        let secondVC = self.navigationController?.viewControllers[1]

        self.navigationController?.popToViewController(secondVC!, animated: true)
        
//        self.dismiss(animated: true)
//        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
        
    }
    
}
