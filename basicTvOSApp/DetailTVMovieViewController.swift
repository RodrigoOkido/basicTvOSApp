//
//  DetailTVMovieViewController.swift
//  basicTvOSApp
//
//  Created by Rodrigo Yukio Okido on 01/04/22.
//

import UIKit
import TVUIKit

class DetailTVMovieViewController: UIViewController {

    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    // MARK: - OUTLETS
    @IBOutlet weak var backgroundDetailsMovieImageView: UIImageView!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - ATTRIBUTES
    private let poster_id = "posterCell"
    let movies: [Movie] = Movie.movies

    var movieDetail: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailCollectionView.dataSource = self
        self.detailCollectionView.delegate = self
        
        setupOutletCustomizations()
        backgroundDetailsMovieImageView.image = UIImage(named: movieDetail!.name)
        movieOverviewLabel.text = movieDetail?.overview
    }
    
    
    func setupOutletCustomizations() {
        playButton.layer.cornerRadius = 10
        saveButton.layer.cornerRadius = 10
    }
}


extension DetailTVMovieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: poster_id, for: indexPath) as! TVMovieDetailCollectionViewCell
        
        let movie = movies[indexPath.row]
        cell.posterView.image = UIImage(named: movie.name)
        cell.posterView.title = movie.name
        return cell
    }
}

extension DetailTVMovieViewController: UICollectionViewDelegate {

}


// MARK: - UI COLLECTIONVIEW DELEGATE FLOW LAYOUT
extension DetailTVMovieViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 360)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    
}
