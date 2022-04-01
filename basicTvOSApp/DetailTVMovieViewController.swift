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
    private let related_section = "relatedSection"
    private let staff_section = "staffSection"
    var movieDetail: Movie?
    var section: [Section]?
    enum Section {
        case relatedMovies([Movie])
        case movieStaff([Movie])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailCollectionView.dataSource = self
        detailCollectionView.delegate = self
        
        setupOutletCustomizations()
        backgroundDetailsMovieImageView.image = UIImage(named: movieDetail!.name)
        movieOverviewLabel.text = movieDetail?.overview
        
        section = [
            .relatedMovies(Movie.movies),
            .movieStaff(Movie.movies)
        ]
        
    }
    
    
    func setupOutletCustomizations() {
        playButton.layer.cornerRadius = 10
        saveButton.layer.cornerRadius = 10
    }
}


extension DetailTVMovieViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        section!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionModel = self.section![section]
        
        switch sectionModel {
        case .relatedMovies(_):
            return 1
        case .movieStaff(_):
            return 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionModel = self.section![indexPath.section]
        
        switch sectionModel {
        case .relatedMovies(_):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: related_section, for: indexPath) as! RelatedMovieSectionCollectionViewCell
            cell.configure()
            return cell
        case .movieStaff(_):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: staff_section, for: indexPath) as! StaffSectionCollectionViewCell
            cell.configure()
            return cell
        }
    }
}

extension DetailTVMovieViewController: UICollectionViewDelegate {

}

extension DetailTVMovieViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let sectionModel = self.section![indexPath.section]

        switch sectionModel {
        case .relatedMovies(let movies):
            return CGSize(width: detailCollectionView.frame.width - 32, height: 400)
        case .movieStaff(let staff):
            return CGSize(width: detailCollectionView.frame.width - 32, height: 400)
        }
    }
}
