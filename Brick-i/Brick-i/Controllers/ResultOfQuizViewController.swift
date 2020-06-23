//
//  ResultOfQuizViewController.swift
//  Brick-i
//
//  Created by JSKeum on 2020/06/23.
//  Copyright © 2020 JSKeum. All rights reserved.
//

import UIKit

class ResultOfQuizViewController: UIViewController {
    
    var sampleQuizImages: [UIImage] = []

    @IBOutlet weak var quizImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSampleQuizImages()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Same Image view sample as QuizTimeViewController
    
    override func viewDidAppear(_ animated: Bool) {
        let date = Date()
        let calendar = Calendar.current
        let minute = calendar.component(.minute, from: date)
        
        let num = minute % 2
        quizImage.image = sampleQuizImages[num]
    }
    
    func addSampleQuizImages() {
        let iguanaImage = UIImage(named: "sampleIguana"
        )
        let elephantImage = UIImage(named: "sampleElephant")
        sampleQuizImages += [iguanaImage!, elephantImage!]
    }
    
    
}
