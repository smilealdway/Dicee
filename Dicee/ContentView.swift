//
//  ContentView.swift
//  Dicee
//
//  Created by Katie McBratney on 8/12/21.
//

import SwiftUI
import AVFoundation

struct ContentView: View {

    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1

    let soundFileURL = Bundle.main.url(forResource: "DiceSound", withExtension: "mp3")
    //let soundFileURL = URL(string: "https://www.fesliyanstudios.com/play-mp3/4933")
    @State var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack{
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    do {
                        try audioPlayer = AVAudioPlayer(contentsOf: soundFileURL!)
                        //audioPlayer!.prepareToPlay()
                        audioPlayer!.play()
                    }catch {
                        print(error)
                    }
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                    
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(5)
                }
                .background(Color.red)
                Spacer()
            }
        }
    }
}

struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding(10)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


