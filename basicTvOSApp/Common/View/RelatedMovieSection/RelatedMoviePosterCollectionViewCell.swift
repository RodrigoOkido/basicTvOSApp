//
//  TVMovieDetailCollectionViewCell.swift
//  basicTvOSApp
//
//  Created by Rodrigo Yukio Okido on 01/04/22.
//

import UIKit
import TVUIKit

class RelatedMoviePosterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterView: TVPosterView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }


    @IBAction func posterCell(_ sender: Any) {
        print(#function)
    }
}
