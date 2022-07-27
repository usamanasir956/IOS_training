//
//  CardHandler.swift
//  Card Game
//
//  Created by Dev on 20/07/2022.
//

import Foundation

class CardHandler{
    func get_card() -> [Card] {
        var genereatedCard = [Card]()
        
        //Create shuffle array to card size to generate unique randon card
        var shuffledCardOrder = Array(1...13)
        shuffledCardOrder.shuffle()
        
        for i in 1...8 {
            let shuffledCard = shuffledCardOrder[i]
            
            let cardOne = Card()
            let cardTwo = Card()
            
            cardOne.imageName = ("card\(shuffledCard)")
            cardTwo.imageName = ("card\(shuffledCard)")
            
            genereatedCard += [cardOne, cardTwo]
            
        }
        genereatedCard.shuffle()
        
        print(genereatedCard)
        return genereatedCard
    }
}
