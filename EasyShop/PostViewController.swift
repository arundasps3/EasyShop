//
//  PostViewController.swift
//  EasyShop
//
//  Created by ARUNDAS PS on 2019-12-10.
//  Copyright © 2019 ARUNDAS PS. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    
    
    
    @IBOutlet weak var titleofad: UITextField!
    
    
    @IBOutlet weak var Description: UITextField!
    
    
    @IBOutlet weak var Photo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func UploadPhotoClicked(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                                        let imagePicker = UIImagePickerController()
                       imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
                                         imagePicker.sourceType = UIImagePickerController.SourceType.camera
                                        imagePicker.allowsEditing = false
                                        self.present(imagePicker, animated: true, completion: nil)
                                    }
                                            
                                        }
                                        
                                 func imagePickerController(_ picker: UIImagePickerController,
                                                                     didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
                                     if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                                                Photo.contentMode = .scaleToFill
                                                Photo.image = pickedImage
                                            }
                                            picker.dismiss(animated: true, completion: nil)
                                        }
    }
    
    
   
   
   
        
    

