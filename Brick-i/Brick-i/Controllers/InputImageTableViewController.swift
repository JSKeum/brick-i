//
//  InputImageTableViewController.swift
//  Brick-i
//
//  Created by JSKeum on 2020/06/17.
//  Copyright © 2020 JSKeum. All rights reserved.
//

import UIKit

class InputImageTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createModelButton()
        self.navigationController?.title = "Brick-i 알려주기"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    var numOfImageClaases = 3
    lazy var numOfSections = numOfImageClaases + 1
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return numOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let firstTableIndex = 0
        
        if (indexPath.section == firstTableIndex) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameOfType", for: indexPath)
            
            
            cell.textLabel?.layer.masksToBounds = true
            cell.textLabel?.layer.cornerRadius = 5
            return cell
        } else if (indexPath.section == numOfSections - 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddNewImage", for: indexPath)
            return cell
        } else {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImagesToBeData", for: indexPath)
        
        if let customCell = cell as? ImagesToBeDataTableViewCell {
            print(customCell)
        }
        // Configure the cell...Colle
        
        return cell
            }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->  CGFloat {
        if (indexPath.section == 0) { return 50}
        else if (indexPath.section == numOfSections - 1) { return 60 }
        
        else { return 120 }
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection
//        section: Int) -> String? {
//        if (section == numOfSections - 1) { return nil }
//        let numOfInpuImages = 3
//        return "이구아나 (" + String(numOfInpuImages) + ")"
//    }
    
    // Header height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == numOfSections - 1) { return 0 }
        return 40
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        
        if (section == 0) { return nil }
        if (section == numOfSections - 1) { return nil }
        
//        label.backgroundColor = .white
        let numOfInpuImages = 3
        label.text = "이구아나 (" + String(numOfInpuImages) + ")"
        
        label.textColor = .white
        return label
    }
   
}

extension InputImageTableViewController {
    func createModelButton() {
//        let bottomView = UIView()
//        bottomView.backgroundColor = .red // or your color
//        
//        bottomView.frame = CGRect(origin: CGPoint(x: tableView.frame.size.width/2, y: UIScreen.main.bounds.size.height - 300), size: CGSize(width: 300, height: 100))
//        //            CGRect(x: tableView.frame.size.width/2, y: UIScreen.main.bounds.size.height - 200, width: 400, height: 78) // 78 or your size of view
//        let uiLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
//        uiLabel.text = "Brcik-i를 다 가르쳤어요"
//        bottomView.addSubview(uiLabel)
//        self.navigationController?.view.addSubview(bottomView)
    }
    
    
}
