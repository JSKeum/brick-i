//
//  StartPlayViewController.swift
//  Brick-i
//
//  Created by JSKeum on 2020/06/18.
//  Copyright © 2020 JSKeum. All rights reserved.
//

import UIKit

class StartPlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let red = UIColor(red: 196/255, green: 58/255, blue: 58/255, alpha: 1)
       
        self.navigationController?.navigationBar.barTintColor = red
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
