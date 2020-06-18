//
//  QuizTimeViewController.swift
//  Brick-i
//
//  Created by JSKeum on 2020/06/18.
//  Copyright © 2020 JSKeum. All rights reserved.
//

import UIKit

class QuizTimeViewController: UIViewController {
    
    @IBOutlet weak var quizImage: UIImageView!
    
    var sampleQuizImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rightButton.isHidden = true
        wrongButton.isHidden = true
        answerOfBrickI.isHidden = false
        
        addSampleQuizImages()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let date = Date()
        let calendar = Calendar.current
        let minute = calendar.component(.minute, from: date)
        
        let num = minute % 2
        quizImage.image = sampleQuizImages[num]
        
        // MARK: - Quiz Timer
        var timeSecond = 4
//        var i = 0
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            
            if (timeSecond > 0) {
            
            timeSecond -= 1
            self.timer.textColor = .black
            self.timer.text = String(timeSecond)
                
                if (timeSecond == 0) {
                   
                    if (num == 0) {
                    self.answerOfBrickI.text = "이구아나! \n제 답이 맞았나요?"
                    } else if (num == 1) {
                        self.answerOfBrickI.text = "수달! \n제 답이 맞았나요?"
                    }
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
   
    func addSampleQuizImages() {
        let iguanaImage = UIImage(named: "sampleIguana"
        )
        let elephantImage = UIImage(named: "sampleElephant")
        sampleQuizImages += [iguanaImage!, elephantImage!]
    }

}
