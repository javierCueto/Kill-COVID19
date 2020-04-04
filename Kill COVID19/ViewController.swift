//
//  ViewController.swift
//  Kill COVID19
//
//  Created by José Javier Cueto Mejía on 04/04/20.
//  Copyright © 2020 Pozolx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    var timer = Timer()
    var counter = 0
    
    var covidArray = [UIImageView]()
    var hideTimer = Timer()
    
    var hightScore = 0
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var hightScoreLabel: UILabel!
    @IBOutlet weak var c1: UIImageView!
    @IBOutlet weak var c2: UIImageView!
    @IBOutlet weak var c3: UIImageView!
    @IBOutlet weak var c4: UIImageView!
    @IBOutlet weak var c5: UIImageView!
    @IBOutlet weak var c6: UIImageView!
    @IBOutlet weak var c7: UIImageView!
    @IBOutlet weak var c8: UIImageView!
    @IBOutlet weak var c9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //highScore
        
        let storedHighscore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighscore == nil {
            hightScore = 0
            hightScoreLabel.text = "Highscore: \(hightScore)"
        }
        
        if let newScore =  storedHighscore as? Int {
            hightScore = newScore
            hightScoreLabel.text = "Highscore : \(hightScore)"
        }
        
        scoreLabel.text = "Score \(score)"
        c1.isUserInteractionEnabled = true
        c2.isUserInteractionEnabled = true
        c3.isUserInteractionEnabled = true
        c4.isUserInteractionEnabled = true
        c5.isUserInteractionEnabled = true
        c6.isUserInteractionEnabled = true
        c7.isUserInteractionEnabled = true
        c8.isUserInteractionEnabled = true
        c9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        c1.addGestureRecognizer(recognizer1)
        c2.addGestureRecognizer(recognizer2)
        c3.addGestureRecognizer(recognizer3)
        c4.addGestureRecognizer(recognizer4)
        c5.addGestureRecognizer(recognizer5)
        c6.addGestureRecognizer(recognizer6)
        c7.addGestureRecognizer(recognizer7)
        c8.addGestureRecognizer(recognizer8)
        c9.addGestureRecognizer(recognizer9)
        
        
        covidArray = [c1,c2,c3,c4,c5,c6,c7,c8,c9]
        
        // timers
        counter = 10
        
        timerLabel.text = "\(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideCovid), userInfo: nil, repeats: true)
        
        hideCovid()
    }
    
    @objc func hideCovid(){
        for c in covidArray {
            c.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(covidArray.count - 1)))
        
        
        covidArray[random].isHidden = false
        
        
        
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown(){
        counter -= 1
        timerLabel.text = "\(counter)"
        
        if counter == 0{
            timer.invalidate()
            hideTimer.invalidate()
            
             for c in covidArray {
               c.isHidden = true
           }
            
            
            //hight score
            
            if self.score > self.hightScore{
                self.hightScore = self.score
                
                hightScoreLabel.text = "Highscore: \(self.hightScore)"
                
                UserDefaults.standard.set(self.hightScore, forKey: "highscore")
            }
            
            let alert = UIAlertController(title: "Time over", message: "Do you want to play again 😎", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: .default) {
                (UIAlertAction) in
                //replay
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                
                self.counter = 10
                self.timerLabel.text = "\(self.counter)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                      
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideCovid), userInfo: nil, repeats: true)
                
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
    }


}

