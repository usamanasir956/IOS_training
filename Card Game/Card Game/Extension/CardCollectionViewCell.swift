//
//  CardCollectionViewCell.swift
//  Card Game
//
//  Created by Dev on 20/07/2022.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card :Card?
    
    func configureCell(card :Card){
        
        //keep track of card
        self.card = card
        
        //set the cell front image from card
        self.frontImageView.image = UIImage.init(named: card.imageName)
        
        //Reset the state of the cell by checking is it flip up or down than show front or back of card
        
        
        if(card.isMatched){
            print("is matched")
            frontImageView.alpha = 0
            backImageView.alpha = 0
            return
            
        }
        else{
            
            frontImageView.alpha = 1
            backImageView.alpha = 1
            
        }
        
        if card.isFlipped == true{
            flipUp(speed: 0)
        }
        else{
            flipDown(speed: 0, duraction: 0)
        }
    
    }
    
    
    func flipUp(speed :Double = 0.3) {
        //flip down to up
        UIView.transition(from: backImageView, to: frontImageView, duration: speed, options: [.transitionFlipFromLeft, .showHideTransitionViews])
        
        card?.isFlipped = true
        
    }
    
    func flipDown(speed :Double = 0.3, duraction :Double = 0.4) {
        //flip down to up
        //Add Some delay in anomation
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duraction , execute: {
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: speed, options: [.transitionFlipFromLeft, .showHideTransitionViews])
        })
        
        card?.isFlipped = false
    }
    
    func removeCard(){
        
        //make image view invisible
        backImageView.alpha = 0
        
        //show anim
        UIView.animate(withDuration: 0.3, delay: 0.5, options:.curveEaseInOut, animations: {
            self.frontImageView.alpha = 0
        }, completion: nil)
    }
}
