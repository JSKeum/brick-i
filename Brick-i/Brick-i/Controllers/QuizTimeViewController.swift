//
//  QuizTimeViewController.swift
//  Brick-i
//
//  Created by JSKeum on 2020/06/18.
//  Copyright © 2020 JSKeum. All rights reserved.
//

import UIKit

class QuizTimeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        rightButton.isHidden = true
        wrongButton.isHidden = true
        answerOfBrickI.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // MARK: - Timer
        
        var timeSecond = 4
//        var i = 0
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            
            if (timeSecond > 0) {
            
            timeSecond -= 1
            self.timer.textColor = .black
            self.timer.text = String(timeSecond)
                
                if (timeSecond == 0) { self.timer.text = ""
//                    self.answerOfBrickI.font = UIFont(name: "Courier", size: 16)
                    self.answerOfBrickI.text = "이구아나! \n제 답이 맞았나요?"
//
                    self.rightButton.isHidden = false
                    self.wrongButton.isHidden = false
                    
                }
            }
    
        }
            
    }
    @IBOutlet weak var wrongButton: UIButton!
    
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var answerOfBrickI: UITextView!
    
    @IBOutlet weak var timer: UILabel! 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
