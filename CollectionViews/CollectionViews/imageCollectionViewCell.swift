//
//  imageCollectionViewCell.swift
//  CollectionViews
//
//  Created by Habib Miranda on 6/14/16.
//  Copyright © 2016 littleJohns. All rights reserved.
//

import UIKit

class imageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func updateImage(image: UIImage) {
        imageView.image = image
    }
    
}
