//
//  ImagesToBeDataTableViewCell.swift
//  Brick-i
//
//  Created by JSKeum on 2020/06/17.
//  Copyright © 2020 JSKeum. All rights reserved.
//

import UIKit

class ImagesToBeDataTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

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
           3
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageInput", for: indexPath)
            let imageView = UIImageView(image: UIImage(named: "IntroFirst"))
    
        imageView.contentMode = .scaleAspectFit
        cell.backgroundView = imageView

        
        return cell
    }
          
}
