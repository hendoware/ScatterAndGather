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
    var shouldScamble = false
    
    var timer = Timer()
    
    @IBOutlet weak var lambdaPic: UIImageView!
    @IBOutlet weak var lambdaLogo: UIImageView!
    
    
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA1: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        initAudio()
        setup()
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
//            musicPlayer.pause()
//            sender.alpha = 0.2
//        } else{
//            musicPlayer.play()
//            sender.alpha = 1.0
//        }
    }
    
    func setup() {

        if !shouldScamble {
//            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector(("setRandomBackgroundColor")), userInfo: nil, repeats: true)
//            self.setRandomBackgroundColor()
//            view.backgroundColor = .green
        }
        if shouldScamble {
            
//            view.backgroundColor = .yellow
            
        }
    }
    
//    func randomColorGenerator() -> Int{
//        let randomColor = Int.random(in: 1..<5)
//        return randomColor
//    }
    func setRandomBackgroundColor() {
        let colors = [
            UIColor(red: 233/255, green: 203/255, blue: 198/255, alpha: 1),
            UIColor(red: 38/255, green: 188/255, blue: 192/255, alpha: 1),
            UIColor(red: 253/255, green: 221/255, blue: 164/255, alpha: 1),
            UIColor(red: 235/255, green: 154/255, blue: 171/255, alpha: 1),
            UIColor(red: 87/255, green: 141/255, blue: 155/255, alpha: 1)
        ]
        let randomColor = Int.random(in: 0..<(colors.count))
        self.view.backgroundColor = colors[randomColor]
    }
    
    @IBAction func toggleBtn(_ sender: Any) {
        if shouldScamble {
            shouldScamble = false
            view.backgroundColor = .green
        } else {
            shouldScamble = true
            view.backgroundColor = .yellow
        }
        
    }
    
    
    
    
    
}

