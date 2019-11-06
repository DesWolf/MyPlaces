//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Максим Окунеев on 11/5/19.
//  Copyright © 2019 Максим Окунеев. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    let restrantNames = [
                        "Burger Heroes", "Blinoff", "Cap of coffee", "People's",
                        "Harats", "Gorky Park", "Vine and Pizza", "HotDog",
                        "Lovers", "Rumors", "Classic Restorant", "Molescine",
                        "Vitcher", "Mexico", "El Capitas"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
            return restrantNames.count
       }
       
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = restrantNames[indexPath.row]
        cell.imageView?.image = UIImage(named: restrantNames[indexPath.row])
        cell.imageView?.layer.cornerRadius = cell.frame.size.height / 2
        cell.imageView?.clipsToBounds = true
        
        return cell
       }

    // MARK: - TableViewDeligate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 85
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
