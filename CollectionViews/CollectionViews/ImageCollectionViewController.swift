//
//  ImageCollectionViewController.swift
//  CollectionViews
//
//  Created by Habib Miranda on 6/14/16.
//  Copyright © 2016 littleJohns. All rights reserved.
//

import UIKit

private let reuseIdentifier = "imageCell"

class ImageCollectionViewController: UICollectionViewController {
    
    let picturesArray = ["0", "1", "2", "3", "4", "5"]

   
    // MARK: UICollectionViewDataSource


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return picturesArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? imageCollectionViewCell ?? imageCollectionViewCell()
        let image = UIImage(named: picturesArray[indexPath.item])
        cell.updateImage(image ?? UIImage())
        return cell 
    }

}
