//
//  CardCollectionViewCell.swift
//  MatchGame
//
//  Created by Haydn Wiese on 2020-03-15.
//  Copyright © 2020 Haydn Wiese. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func setCard(_ card: Card) {
        self.card = card
        
        if card.isMatched {
            // If the card has been matched, make the image views invisible
            backImageView.alpha = 0
            frontImageView.alpha = 0
            return
        } else {
            // If the card hasn't been matched, make the image views visible
            backImageView.alpha = 1
            frontImageView.alpha = 1
        }
        
        frontImageView.image = UIImage(named: card.imageName)

        if card.isFlipped {
            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        } else {
            UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
    }
    
    func flip() {
        UIView.transition(from: backImageView,
                          to: frontImageView,
                          duration: 0.3,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews],
                          completion: nil)
    }
    
    func flipBack() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.transition(from: self.frontImageView,
                              to: self.backImageView,
                              duration: 0.3,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
        }
        
    }
    
    // PURPOSE: Removes both imageviews from being visible
    func remove() {
        backImageView.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImageView.alpha = 0
        }, completion: nil)
        frontImageView.alpha = 0
    }
}
