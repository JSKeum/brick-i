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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    var numOfImageClaases = 5
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return numOfImageClaases
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImagesToBeData", for: indexPath)
        
        if let customCell = cell as? ImagesToBeDataTableViewCell {
            print(customCell)
        }
        // Configure the cell...Colle
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->  CGFloat {
        
        return 150
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
        section: Int) -> String? {
        return "이구아나"
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension InputImageTableViewController {
    func createModelButton() {
        let bottomView = UIView()
        bottomView.backgroundColor = .red // or your color
        
        bottomView.frame = CGRect(origin: CGPoint(x: tableView.frame.size.width/2, y: UIScreen.main.bounds.size.height - 300), size: CGSize(width: 300, height: 100))
        //            CGRect(x: tableView.frame.size.width/2, y: UIScreen.main.bounds.size.height - 200, width: 400, height: 78) // 78 or your size of view
        let uiLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        uiLabel.text = "Brcik-i를 다 가르쳤어요"
        bottomView.addSubview(uiLabel)
        self.navigationController?.view.addSubview(bottomView)
    }
}
