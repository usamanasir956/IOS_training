//
//  FourthViewController.swift
//  navigation
//
//  Created by Dev on 25/07/2022.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func nextScreen(_ sender: Any) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "FifthViewControllerID")
       
        self.navigationController?.setViewControllers([secondVC!], animated: true)
//        self.navigationController?.pushViewController(secondVC!, animated: true)

//        present(secondVC!, animated: true, completion: nil)

//        self.dismiss(animated: true)
    }

}
