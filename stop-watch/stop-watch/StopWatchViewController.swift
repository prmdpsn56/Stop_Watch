//
//  StopWatchViewController.swift
//  stop-watch
//
//  Created by Abhi on 2019-04-08.
//  Copyright © 2019 Param. All rights reserved.
//

import UIKit

class StopWatchViewController:UIViewController{
    
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timerLabel:UILabel!
    @IBOutlet weak var pauseButton:UIButton!
    @IBOutlet weak var startButton:UIButton!
    
    
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
    }
    
    @IBAction func resetDidTap(_ sender: Any)
    {
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        timerLabel.text = "00:00:00.0"
        resetButton.isEnabled = false
        
        startButton.isEnabled = true
        
        pauseButton.isEnabled = true
        
    
    }
    
    @IBAction func pauseDidTap(_ sender: Any)
    {
     resetButton.isEnabled = true
        startButton.isEnabled = true
        pauseButton.isEnabled = false
//        print("pause button tap")
        isTimerRunning = false
        timer.invalidate()
    }


    @IBAction func startDidTap(_ sender: Any)
    { if !isTimerRunning {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        
        isTimerRunning  = true
        
        resetButton.isEnabled = true
        pauseButton.isEnabled = true
        startButton.isEnabled = false
        }
    }
    
    
//    mark helper method
    
        @objc func runTimer(){
        
            counter += 0.1
//            timerLabel.text = "\(counter)"
            
        let flooredCounter = Int(floor(counter))
            let hour = flooredCounter / 3600
            
            let minute = (flooredCounter % 3600) / 60
            var minuteString = "\(minute)"
            if minute < 10 {
                minuteString = "0\(minute)"
            }
            let second = (flooredCounter % 3600) % 60
            var secondString = "\(second)"
            if second < 10 {
                secondString = "0\(second)"
            }
            let decisecond = String(format: "%.1f",
                                    
    counter).components(separatedBy:".").last!
            
            timerLabel.text = "\(hour):\(minuteString):\(secondString).\(decisecond)"
    }
    
    
    
}
