//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Максим Окунеев on 11/7/19.
//  Copyright © 2019 Максим Окунеев. All rights reserved.
//

import UIKit

class NewPlaceViewController: UITableViewController {
   
    @IBOutlet weak var imageOfPlace: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }

// MARK: Table View Deligate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        if indexPath.row == 0 {
            
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(source: .camera)
                }
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
                }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
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

// MARK: Work with image

extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
        
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
            
            imageOfPlace.image = info[.editedImage] as? UIImage
            imageOfPlace.contentMode = .scaleAspectFill
            imageOfPlace.clipsToBounds = true
            dismiss(animated: true)
        }
}

