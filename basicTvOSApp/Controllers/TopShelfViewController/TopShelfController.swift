//
//  TopShelf.swift
//  basicTvOSApp
//
//  Created by Rodrigo Yukio Okido on 02/04/22.
//

import Foundation
import UIKit

class TopShelfController: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var moreInfoButton: UIButton!
    
    let movies: [Movie] = Movie.movies

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupOutletComponents()
    }
    
    
    func setupOutletComponents() {
        // Customize components.
        playButton.layer.cornerRadius = 10
        moreInfoButton.layer.cornerRadius = 10
        
        // Load data
        movieImage.image = UIImage(named: movies[0].name)
        movieTitle.text = movies[0].name
    }
}
