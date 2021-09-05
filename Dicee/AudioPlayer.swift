//
//  AudioPlayer.swift
//  Dicee
//
//  Created by Katie McBratney on 8/25/21.
//
import AVFoundation
import Foundation

class AudioPlayer:NSObject,ObservableObject,AVAudioPlayerDelegate {
    let soundFileURL = Bundle.main.url(forResource: "DiceSound", withExtension: "mp3")
    @Published var hasPlayingStopped = 0
    var audioPlayer: AVAudioPlayer?
    
    override init() {
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: soundFileURL!)
        } catch {
            print(error)
        }
        
    }
    
    func playAudio() -> Void {
        audioPlayer?.delegate = self
        audioPlayer!.play()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        hasPlayingStopped += 1;
    }
}
