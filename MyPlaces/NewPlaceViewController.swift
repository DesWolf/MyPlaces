//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Максим Окунеев on 11/7/19.
//  Copyright © 2019 Максим Окунеев. All rights reserved.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
    }


// MARK: Table View Deligate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
}

// MARK: Texxt field Deligate

extension NewPlaceViewController: UITextFieldDelegate {
    
    // Hide keyboard by clicking "Done"
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
