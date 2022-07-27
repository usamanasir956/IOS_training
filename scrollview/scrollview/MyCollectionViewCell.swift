//
//  MyCollectionViewCell.swift
//  scrollview
//
//  Created by Dev on 22/07/2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func config() {
        let a = Int.random(in: 1...100)
        
        idLabel.text = String(a)
        nameLabel.text = String(a)
    }
}


class MyUICollectionReusableView : UICollectionReusableView{
}
