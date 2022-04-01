//
//  DetailTVMovieViewController.swift
//  basicTvOSApp
//
//  Created by Rodrigo Yukio Okido on 01/04/22.
//

import UIKit

class DetailTVMovieViewController: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet weak var backgroundDetailsMovieImageView: UIImageView!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - ATTRIBUTES
    var movieDetail: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOutletCustomizations()
        backgroundDetailsMovieImageView.image = UIImage(named: movieDetail!.name)
        movieOverviewLabel.text = movieDetail?.overview
    }
    
    
    func setupOutletCustomizations() {
        playButton.layer.cornerRadius = 10
        saveButton.layer.cornerRadius = 10
    }


}
