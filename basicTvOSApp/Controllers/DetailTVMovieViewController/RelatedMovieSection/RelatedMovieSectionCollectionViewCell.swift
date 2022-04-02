//
//  RelatedMoviePosterCollectionViewCell.swift
//  basicTvOSApp
//
//  Created by Rodrigo Yukio Okido on 01/04/22.
//

import UIKit
import TVUIKit


class RelatedMovieSectionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let poster_id = "posterCell"
    let relatedMovies: [Movie] = Movie.movies
    
    /**
     Configure cell.
     */
    func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


extension RelatedMovieSectionCollectionViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return relatedMovies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: poster_id, for: indexPath) as! RelatedMoviePosterCollectionViewCell
        
        let movie = relatedMovies[indexPath.row]
        cell.posterView.image = UIImage(named: movie.name)
        cell.posterView.title = movie.name
        return cell
    }
}


extension RelatedMovieSectionCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 380)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}
