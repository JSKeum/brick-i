//
//  IntroViewController.swift
//  Brick-i
//
//  Created by JSKeum on 2020/06/17.
//  Copyright © 2020 JSKeum. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToInputController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "InputImageAndPlay", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "InputImage")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
