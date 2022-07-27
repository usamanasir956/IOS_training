//
//  Present2ViewController.swift
//  navigation
//
//  Created by Dev on 25/07/2022.
//

import UIKit

class Present2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextScreen(_ sender: Any) {
        let second  = self.storyboard?.instantiateViewController(withIdentifier: "Present3ViewController")
        
        present(second!, animated: true, completion: nil)
    }

}
