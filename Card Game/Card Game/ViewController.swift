//
//  ViewController.swift
//  Card Game
//
//  Created by Dev on 20/07/2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    var firstFlippedCardIndex :IndexPath?
    var timer :Timer?
    
    //remaing milisecond total 10 sec
    var remaningMiliSecond :Int = 10*1000
    var remaningCard :Int!
    
    var soundPlayer :SoundManager = SoundManager()
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cardHandler = CardHandler()
    var cardArray = [Card]()
    
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.landscape
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cardArray = cardHandler.get_card()
        
        //set view controller as a datasource
        collectionView.dataSource = self
        collectionView.delegate = self
        
        remaningCard = cardArray.count
        
        //initilize the time with milisecond interval
        timer = Timer.scheduledTimer(timeInterval: 1/1000, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        
        //Change timer runloop as it stop updating when user interact with app
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        //Play Shuffle Sound
        soundPlayer.play(effect: .shuffle)
    }
    
    // MARK: - Timer Funtions
    
    @objc func timerFired(){
        
        remaningMiliSecond -= 1
        
        //Update the timer
        let seconds :Double = Double(remaningMiliSecond)/1000.0
        timerLabel.text = String(format: "Time remaning : %.2f", seconds)
        
        //Timer over condition
        if(remaningMiliSecond == 0){
            
            timerLabel.textColor = UIColor.red
            
            //Stop the timer
            timer?.invalidate()
            
            //Check the game end
            checkForGameEnd()
            
        }
    }

    // MARK: - Collection View DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Create Collection View Cell
        // or Get Collection View Cell from recycle
        //CardCell is isdentifier of Collection Cell in storyboard
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        //return cell
        return cell
    }
    
    //Configure the cell Everytime when it going to visible
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let cardCell = cell as? CardCollectionViewCell
        
        //get card from arrya
        let card = cardArray[indexPath.row]
        
        //configure cell fro that card
        cardCell?.configureCell(card: card)
    }
    
    //UICollectionViewDelegate On Card Tap Funtion
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Don't allow to interact if time is over
        guard remaningMiliSecond != 0 else {
            return
        }
        
        
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        if(cell?.card?.isFlipped == false && cell?.card?.isMatched == false){
            
            //Play Shuffle Sound
            soundPlayer.play(effect: .flip)
            
            cell?.flipUp()
            
            //Check if this was the first card otherwise compare two card
            if(firstFlippedCardIndex == nil){
                
                firstFlippedCardIndex = indexPath
            }
            else{
                
                //Game logic to compare two card
                checkForMatch(indexPath)
            }
        }
    }
    
    // MARK: -Game Logic Comparsion Card
    func checkForMatch(_ secondFlippedCardIndex :IndexPath){
        //if two card are matched remove them
        //if doesnot match flip them back
        
        let firstCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        let secondCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        
        //Get Card From arrya and change property because collection view doesnot hold their card and need card again to configure
        
        let firstCard = cardArray[firstFlippedCardIndex!.row]
        let secondCard = cardArray[secondFlippedCardIndex.row]
        
        
        if(firstCard.imageName == secondCard.imageName){
            
            //Play Correct Sound
            soundPlayer.play(effect: .correct)
    
            remaningCard -= 2
            
            firstCard.isMatched = true
            secondCard.isMatched = true
            
            firstCell?.removeCard()
            secondCell?.removeCard()
        }
        else{
            //Play Wrong Sound
            soundPlayer.play(effect: .wrong)
            
            firstCard.isFlipped = false
            secondCard.isFlipped = false
            
            firstCell?.flipDown()
            secondCell?.flipDown()
        }
        
        //reset the card match
        firstFlippedCardIndex = nil
    }
    
    func checkForGameEnd() {
        
        // if any card remaing
        if(remaningCard == 0){
            
            //Play Wrong Sound
            soundPlayer.play(effect: .correct)
            
            //Won ther game
            showAlert(title: "Congratulations", message: "You Won the Game! 🏆")
        }
        else{
            
            if(remaningMiliSecond == 0){
                
                //Lose the game
                showAlert(title: "Time's Up", message: "Sorry, Better luch next time! 😡")
            }
        }
        
    }
    
    // MARK: -Helper Funtion
    
    func showAlert(title :String, message :String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        //Action to alter
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        //show alter in uiview
        present(alert, animated: true, completion: nil)
    }
}

