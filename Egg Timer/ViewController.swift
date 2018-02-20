//
//  ViewController.swift
//  Egg Timer
//
//  Created by Bill Proudfoot on 14/11/2017.
//  Copyright © 2017 Bill Proudfoot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var timerLabel = 260
    
    @objc func displayTime() {
        
        timerCountLabel.text = String(timerLabel)
        
    }
    
    @objc func decreaseTimer() {
        
        if timerLabel == 0 {
            timer.invalidate()
        } else {
        timerLabel -= 1
        
        displayTime()
        }
        
    }
    
    

    @IBAction func playButton(_ sender: Any) {
        print("play pressed")
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        
        timer.invalidate()
        
    }
    
    @IBOutlet weak var timerCountLabel: UILabel!
    
    @objc func resetTimer () {
        
        timerLabel = 260
        
        displayTime()
        
    }
    
    @IBOutlet weak var eggImageView: UIImageView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetTimer()
        
    }

   

    @IBAction func minusTen(_ sender: Any) {
        if timerLabel <= 10 {
           
        } else {
            timerLabel -= 10
            
            displayTime()
        }
        
    }
    
    @IBAction func plusTen(_ sender: Any) {
        timerLabel += 10
        displayTime()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        
        timer.invalidate()
        resetTimer()
    }
    
}

