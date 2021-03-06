//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Максим Окунеев on 11/8/19.
//  Copyright © 2019 Максим Окунеев. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place) {
        
        try! realm.write {
            realm.add(place)
        }
    }
        
    static func deleteObject(_ place: Place) {
        
        try! realm.write {
            realm.delete(place)
        }
    }
}

