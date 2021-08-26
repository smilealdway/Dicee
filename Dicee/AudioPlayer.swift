//
//  AudioPlayer.swift
//  Dicee
//
//  Created by Katie McBratney on 8/25/21.
//
import AVFoundation
import Foundation

struct AudioPlayer {
    let soundFileURL = Bundle.main.url(forResource: "DiceSound", withExtension: "mp3")
    
    func playDiceSound(){
        //URL(string: url)
        
        do {
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
//            try AVAudioSession.sharedInstance().setActive(true)
            let player = try AVAudioPlayer(contentsOf: soundFileURL!)
            player.prepareToPlay()
            player.play()
            print("sound played")
        } catch {
            print(error)
        }
    }
    
    
}
