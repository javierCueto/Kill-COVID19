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
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    


}

