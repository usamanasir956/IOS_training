//
//  FifthViewController.swift
//  navigation
//
//  Created by Dev on 25/07/2022.
//

import UIKit

class FifthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func nextScreen(_ sender: Any) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SixViewControllerID")
        self.navigationController?.pushViewController(secondVC!, animated: true)

//        present(secondVC!, animated: true, completion: nil)

    }


}
