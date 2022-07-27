//
//  SoundManager.swift
//  Card Game
//
//  Created by Dev on 22/07/2022.
//

import Foundation
import AVFoundation

class SoundManager{
    
    var audioPlayer = AVAudioPlayer()
    
    enum SoundEffect{
        case flip
        case correct
        case wrong
        case shuffle
        
        var fileName :String {
            switch self {
            case .flip:
                return "cardflip"
            case .correct:
                return "dingcorrect"
            case .wrong:
                return "dingwrong"
            case .shuffle:
                return "shuffle"
            }
        }
    }
    
    func play(effect :SoundEffect) {
        //Play the sound
        
        //Get file
        let bundleSoundPath = Bundle.main.path(forResource: effect.fileName, ofType: ".wav")
        
        guard bundleSoundPath != nil else {
            return
        }
        //Pass to AudioPlayer
        let url = URL(fileURLWithPath: bundleSoundPath!)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            
            //Play sound
            audioPlayer.play()
        }
        catch{
            print("Resource not found")
            return
        }
        
        
    }
}
