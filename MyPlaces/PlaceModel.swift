//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Максим Окунеев on 11/6/19.
//  Copyright © 2019 Максим Окунеев. All rights reserved.
//

import Foundation

struct Place {
    
    var name: String
    var location: String
    var type: String
    var image: String

    static let restrantNames = [
                        "Burger Heroes", "Blinoff", "Cap of coffee", "People's",
                        "Harats", "Gorky Park", "Vine and Pizza", "HotDog",
                        "Lovers", "Rumors", "Classic Restorant", "Molescine",
                        "Vitcher", "Mexico", "El Capitas"
        ]
    
    static func getPlaces()-> [Place] {
        
        var places = [Place]()
        
        for place in restrantNames {
            places.append(Place(name: place, location: "Tomsk", type: "Restorant", image: place))
        }
   
        return places
    }
}
