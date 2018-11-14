//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Sean Hendrix on 11/14/18.
//  Copyright © 2018 Sean Hendrix. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var musicPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initAudio()
    }
    
    func initAudio() {
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    @IBAction func musicBtn(_ sender: UIButton) {
        print("sorry loop = -1")
//        if musicPlayer.isPlaying {
//
//            musicPlayer.pause()
//            sender.alpha = 0.2
//        } else{
//            musicPlayer.play()
//            sender.alpha = 1.0
//        }
    }
    
    
}

