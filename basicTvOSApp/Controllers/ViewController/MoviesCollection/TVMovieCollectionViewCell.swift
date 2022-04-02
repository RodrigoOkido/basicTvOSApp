//
//  TVMovieCollectionViewCell.swift
//  basicTvOSApp
//
//  Created by Rodrigo Yukio Okido on 31/03/22.
//

import UIKit

class TVMovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieThumbnail: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureInitialAppearance()
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        print(#function)
        
        if context.nextFocusedView == self {
            coordinator.addCoordinatedAnimations {
                self.addMotionEffect(UIView.motionEffectGroup)
                self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.movieTitle.transform = .identity
            }
        }
        
        if context.previouslyFocusedView == self {
            coordinator.addCoordinatedAnimations {
                self.motionEffects.removeAll()
                self.transform = .identity
                self.movieTitle.transform = CGAffineTransform(scaleX: .zero, y: .zero)
            }
        }
        
    }
    
    private func configureInitialAppearance() {
        self.movieTitle.transform = CGAffineTransform(scaleX: .zero, y: .zero)
        movieThumbnail.layer.cornerRadius = 10
        movieThumbnail.clipsToBounds = true
    }

    
}
