//
//  ViewController.swift
//  MyStopWatchApp
//
//  Created by Atsushi Sakai on 2017/03/31.
//  Copyright © 2017年 Atsushi Sakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    var startTime: TimeInterval? = nil
    var timer = Timer()
    var elapsedTime: Double = 0.0
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(){
        //print(Date.timeIntervalSinceReferenceDate)
        if let startTime = self.startTime {
            let t = Date.timeIntervalSinceReferenceDate-startTime+elapsedTime
            //print(t)
            let min = Int(t / 60)
            let sec = Int(t) % 60
            let msec = Int((t - Double(sec) - Double(min)*60.0 )*100.0)
            //print(min,sec,msec)
            self.timerLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
            
        }
    }
    
    func setButtonEnabled(start: Bool, stop: Bool, reset: Bool){
        startButton.isEnabled = start
        stopButton.isEnabled = stop
        resetButton.isEnabled = reset
        
    }

    @IBAction func timerStart(_ sender: Any) {
        setButtonEnabled(start: false, stop: true, reset: false)

        startTime = Date.timeIntervalSinceReferenceDate
        self.timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(self.update),
            userInfo: nil,
            repeats: true)
    }

    @IBAction func timerStop(_ sender: Any) {
        setButtonEnabled(start: true, stop: false, reset: true)

        if let startTime = self.startTime {
            self.elapsedTime += Date.timeIntervalSinceReferenceDate - startTime
        }
        self.timer.invalidate()
    }

    @IBAction func timerReset(_ sender: Any) {
        setButtonEnabled(start: true, stop: false, reset: false)

        self.startTime = nil
        self.timerLabel.text = "00:00:00"
        self.elapsedTime = 0.0
    }
    
}

