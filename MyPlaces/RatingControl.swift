//
//  RatingControl.swift
//  MyPlaces
//
//  Created by Максим Окунеев on 11/16/19.
//  Copyright © 2019 Максим Окунеев. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
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
    
    
    var rating = 0

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
    
    @objc func retingButtonTapped(button: UIButton) {
        print("Button pressed! 😯")
    }
    
    // MARK: Private Methods
    
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        for _ in 0..<starCount {
         
            // Create  the button
                let button = UIButton()
                button.backgroundColor = .red
                
                // Add Constraint
                button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
                
                // Setup the button action
                button.addTarget(self, action: #selector(retingButtonTapped(button:)), for: .touchUpInside)
                
                // Add the button to the stack
                addArrangedSubview(button)
            
                // Add the new button on the rating button array
            ratingButtons.append(button)
            }
        }
        
    
}
