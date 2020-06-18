//
//  InputImageTableViewController.swift
//  Brick-i
//
//  Created by JSKeum on 2020/06/17.
//  Copyright © 2020 JSKeum. All rights reserved.
//

import UIKit

class InputImageTableViewController: UITableViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var initialImage: UIImage?
    var imagePicker: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Take Initial Photo
        imagePicker = UIImagePickerController()
        imagePicker?.sourceType = .camera
        imagePicker?.delegate = self
        present(imagePicker!, animated: true, completion: nil)
        
        
//        createModelButton()
        self.navigationController?.title = "Brick-i 알려주기"
        
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "back13")!)

        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker?.dismiss(animated: true) {
               if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                   
                self.initialImage = image
                self.tableView.reloadData()
               }
           }
        
    }
    
    // MARK: - After Initial photo
    
    var numOfImageClaases = 1
    var nameOfGroup: [String] = ["이구아나"]
    
    var numOfSections: Int { return numOfImageClaases + 3 }
    
    
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
        
        if (indexPath.section == numOfSections - 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Finish", for: indexPath)
            return cell
        }
        else if (indexPath.section == firstTableIndex) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "nameOfType", for: indexPath)
            
            
            cell.textLabel?.layer.masksToBounds = true
            cell.textLabel?.layer.cornerRadius = 5
            return cell
            
        } else if (indexPath.section == numOfSections - 2) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddNewImage", for: indexPath)
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImagesToBeData", for: indexPath)
            
            if let customCell = cell as? ImagesToBeDataTableViewCell {
                if (indexPath.section == 1) {
                    if (customCell.images.count == 0) {
                        customCell.initialImage = self.initialImage
                        customCell.initImage()
                    }
                }
                
            }
            // Configure the cell...Colle
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->  CGFloat {
        if (indexPath.section == 0) { return 50}
        else if (indexPath.section == numOfSections - 1 || indexPath.section == numOfSections - 2) { return 60 }
            
        else { return 120 }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == numOfSections - 1 || section == numOfSections - 2) { return 0 }
        return 40
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        
        //        if (section == 0) { return nil }
        if (section == numOfSections - 1 || section == numOfSections - 2 || section == 0) { return nil }
        
        //        label.backgroundColor = .white
//        let numOfInpuImages = 3
        label.text = nameOfGroup[section-1] 
        
        label.textColor = .white
        return label
    }
    
    // MARK: - Add New Model Group (Text Alert)
    @IBAction func addNewGroup(_ sender: Any) {
        
        let alert = UIAlertController(title: "새로운 동물 추가히기", message: "새로운 동물의 이름을 입력해주세요", preferredStyle: .alert)
        alert.addTextField()
        let ok = UIAlertAction(title: "추가", style: .default) { (ok) in
            
            if let text = alert.textFields?[0].text {
                self.numOfImageClaases += 1
                self.nameOfGroup += [text]
                self.tableView.reloadData()
            }
            
        }
        let cancel = UIAlertAction(title: "취소", style: .default)
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - Connect play Storyboard
    
    
    @IBAction func connectToPlay(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PlayWtihBrickI", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "LetsPlay")
        navigationController?.pushViewController(viewController, animated: true)
        
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

