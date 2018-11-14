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
    
    //@IBOutlet weak var lambdaPic: UIImageView!
    @IBOutlet weak var lambdaLogo: UIImageView!
    @IBOutlet var letters: [UILabel]!
    
    @IBOutlet weak var letterL: UILabel!
    @IBOutlet weak var letterA1: UILabel!
    @IBOutlet weak var letterM: UILabel!
    @IBOutlet weak var letterB: UILabel!
    @IBOutlet weak var letterD: UILabel!
    @IBOutlet weak var letterA: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        initAudio()
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
        
        //view.backgroundColor = generateRandomColor()
        
            
        if !shouldScamble {

//            view.backgroundColor = .green
        }
        if shouldScamble {
            
//            view.backgroundColor = .yellow
            
        }
    }
    
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
    
    func generateRandomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    @IBAction func toggleBtn(_ sender: Any) {
        shouldScamble.toggle()
        saveCoordinates()
        //view.backgroundColor = generateRandomColor()
        if shouldScamble {
            scramble()
        } else {
            unscramble()
            timer.invalidate()
        }
        
    }
    
    func scramble() {
        timer = Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(self.animode), userInfo: nil, repeats: true)
    }
    
    func unscramble() {
        for letter in letters {
            UIView.animate(withDuration: 2) {
                self.lambdaLogo.alpha = 1
                letter.transform = .identity
                letter.backgroundColor = nil
                letter.textColor = .black
                self.view.backgroundColor = .white
            }
        }
    }
    
    @objc func animode() {
        UIView.animate(withDuration: 4, animations: {
            self.lambdaLogo.alpha = 0
        }) { (_) in
            UIView.animate(withDuration: 4, animations: {
                self.lambdaLogo.alpha = 1
            })
        }
        
        for letter in letters {
            let location = randomLocation()
            UIView.animate(withDuration: 1) {
                var matrix = letter.transform
                matrix.rotated(by: CGFloat.pi / 1.5)
                matrix.tx = location.x
                matrix.ty = location.y
                
                letter.backgroundColor = self.generateRandomColor()
                letter.textColor = self.generateRandomColor()
                
                letter.transform = matrix
            }
        }
        view.backgroundColor = generateRandomColor()
    }
    
    func randomLocation() -> (x: CGFloat, y: CGFloat) {
        return (CGFloat.random(in: -200...200), CGFloat.random(in: -300...300))
    }
    
    var xCoordinates: [CGFloat] = [8, 16, 24, 36, 44, 52]
    var yCoordinates: [CGFloat] = [8, 16, 24, 36, 44, 52]
    
    func saveCoordinates() {
        var count = 0
        for letter in letters {
            xCoordinates[count] = letter.center.x
            yCoordinates[count] = letter.center.y
            count += 1
        }
    }
    
}

