//
//  ImagesToBeDataTableViewCell.swift
//  Brick-i
//
//  Created by JSKeum on 2020/06/17.
//  Copyright © 2020 JSKeum. All rights reserved.
//

import UIKit

class ImagesToBeDataTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var images: [UIImage] = []
    
    var imagePicker: UIImagePickerController?
    
    var initialImage: UIImage?
    
    func initImage() {
//        self.imageCollectionView.performBatchUpdates({
        if let image = initialImage {
            images += [image]
        }
        imageCollectionView.reloadData()
//        }, completion: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imagePicker = UIImagePickerController()
        imagePicker?.sourceType = .camera
        imagePicker?.delegate = self
        
//        if let image = initialImage {
//            images += [image]
//        }
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var numOfImages: Int { return images.count }
    var numOfCells: Int  { return numOfImages + 1 }
    
    @IBOutlet weak var imageCollectionView: UICollectionView! {
        didSet {
            imageCollectionView.delegate = self
            imageCollectionView.dataSource = self
            
            // 셀 간 간격 조정
            imageCollectionView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    
    
    
}

extension ImagesToBeDataTableViewCell {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (indexPath.row == numOfCells - 1) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddImage", for: indexPath)
            
            return cell
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageInput", for: indexPath)
            let imageView = UIImageView(image: images[indexPath.row])
            
            imageView.contentMode = .scaleAspectFit
            cell.backgroundView = imageView
            
            return cell
        }
    }
    
}


extension ImagesToBeDataTableViewCell: UIImagePickerControllerDelegate & UINavigationControllerDelegate   {
    @IBAction func addImage(_ sender: Any) {
//        let imagePicker = UIImagePickerController()
//        imagePicker.sourceType = .camera
//        imagePicker.delegate = self
//        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        
        self.window?.rootViewController?.present(imagePicker!, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imagePicker?.dismiss(animated: true) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            self.imageCollectionView.performBatchUpdates({
            self.images += [image]
            
            }, completion: nil)

            
        }
    }
    }
}
