//
//  StaffSectionCollectionViewCell.swift
//  basicTvOSApp
//
//  Created by Rodrigo Yukio Okido on 01/04/22.
//

import UIKit

class StaffSectionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!

    private let staff_id = "staffCell"
    let staff: [Movie] = Movie.movies
    
    
    /**
     Configure cell.
     */
    func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


extension StaffSectionCollectionViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return staff.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: staff_id, for: indexPath) as! StaffMonogramCollectionViewCell
        
        let movie = staff[indexPath.row]
        cell.staffMonogram.title = movie.name
        return cell
    }
}

extension StaffSectionCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 380)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

