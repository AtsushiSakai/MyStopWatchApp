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
            let t = Date.timeIntervalSinceReferenceDate-startTime
            print(t)
        }
    }

    @IBAction func timerStart(_ sender: Any) {
        startTime = Date.timeIntervalSinceReferenceDate
        Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(self.update),
            userInfo: nil,
            repeats: true)
    }

    @IBAction func timerStop(_ sender: Any) {
    }

    @IBAction func timerReset(_ sender: Any) {
    }
    
}

