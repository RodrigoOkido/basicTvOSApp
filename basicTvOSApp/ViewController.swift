//
//  ViewController.swift
//  basicTvOSApp
//
//  Created by Rodrigo Yukio Okido on 31/03/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet weak var backgroundMovieImageView: UIImageView!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    // MARK: - ATTRIBUTES
    private let movieCell_id = "TVMovieCell"
    let movies: [Movie] = Movie.movies
    let focusGuide: UIFocusGuide = UIFocusGuide()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        
        backgroundMovieImageView.image = UIImage(named: movies.first!.name)
        view.addLayoutGuide(focusGuide)
        
        NSLayoutConstraint.activate([
            focusGuide.bottomAnchor.constraint(equalTo: moviesCollectionView.topAnchor),
            focusGuide.leftAnchor.constraint(equalTo: moviesCollectionView.leftAnchor),
            focusGuide.widthAnchor.constraint(equalTo: moviesCollectionView.widthAnchor),
            focusGuide.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let previous = context.previouslyFocusedView,
              let next = context.nextFocusedView else { return }
        
        focusGuide.isEnabled = !(next is UICollectionViewCell)
        focusGuide.preferredFocusEnvironments = [previous]
    }
}


// MARK: - UI COLLECTIONVIEW DATASOURCE
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCell_id, for: indexPath) as! TVMovieCollectionViewCell
        
        let movie = movies[indexPath.row]

        cell.movieThumbnail.image = UIImage(named: movie.name)
        cell.movieTitle.text = movie.name
        
        return cell
    }
}


// MARK: - UI COLLECTIONVIEW DELEGATE
extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        guard let indexPath = context.nextFocusedIndexPath else { return }
        let movie = movies[indexPath.row]
        
        UIView.transition(with: backgroundMovieImageView,
                          duration: 0.2,
                          options: .transitionCrossDissolve) {
            self.backgroundMovieImageView.image = UIImage(named: movie.name)
        }
    }
}


// MARK: - UI COLLECTIONVIEW DELEGATE FLOW LAYOUT
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        60
    }
}


