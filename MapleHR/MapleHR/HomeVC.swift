//
//  HomeVC.swift
//  MapleHR
//
//  Created by Dev on 25/07/2022.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    
    public var user :User!
    
    override func viewDidLoad() {
//        super.viewDidLoad()
//        IdLabel.text = "\(user.id)"
//        NameLabel.text = user.name
//        EmailLabel.text = user.email
    }
    
}
