//
//  RatingControl.swift
//  MyPlaces
//
//  Created by Максим Окунеев on 11/16/19.
//  Copyright © 2019 Максим Окунеев. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    var rating = 0 {
        didSet {
                updateButtonSelectionState()
        }
    }
    
    // MARK: Properties
    
    private var  ratingButtons = [UIButton]()
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet{
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet{
            setupButtons()
        }
    }

    // MARK: Inicialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    // MARK: Button Action
    
    @objc func ratingButtonTapped(button: UIButton) {
        
        guard let index = ratingButtons.firstIndex(of: button) else { return }
        
        //Calculate the rating of selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
        
    }
    
    // MARK: Private Methods
    
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        // Load button image
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
         
            // Create  the button
            let button = UIButton()
            button.backgroundColor = .none
        
            // Set the button image
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add Constraint
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
                
            // Setup the button action
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
                
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button on the rating button array
            ratingButtons.append(button)
            }
        
        updateButtonSelectionState()
        
        }
        
    private func updateButtonSelectionState() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
}
