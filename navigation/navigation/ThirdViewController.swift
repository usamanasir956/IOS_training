//
//  ThirdViewController.swift
//  navigation
//
//  Created by Dev on 25/07/2022.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func nextScreen(_ sender: Any) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "FourthViewControllerID")
        
        
        
//      self.navigationController?.setViewControllers([secondVC!], animated: true)
        self.navigationController?.pushViewController(secondVC!, animated: true)
        
        
        // Present With new navigation controller to vc
        
//      let nv = UINavigationController(rootViewController: secondVC)
//      nv.navigationBar.backgroundColor = UIColor.blue
//      present(secondVC, animated: true, completion: nil)
    }
    
}
