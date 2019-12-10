//
//  SignUpViewController.swift
//  EasyShop
//
//  Created by ARUNDAS PS on 2019-12-10.
//  Copyright © 2019 ARUNDAS PS. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class SignUpViewController: UIViewController {
    
    
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ConfirmPassword: UITextField!
    
    
    var user : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        user = Database.database().reference().child("Users")
        
    }
    
    @IBAction func SignUpClicked(_ sender: Any) {
        
        
        if Password.text != ConfirmPassword.text {
                      let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
                      let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                  
                      alertController.addAction(defaultAction)
                      self.present(alertController, animated: true, completion: nil)
                              }
                      else{
                       
                       
                      Auth.auth().createUser(withEmail: Email.text!, password: Password.text!){ (user, error) in
                       if error == nil {
                         
                           let UserDetails = Auth.auth().currentUser?.uid
                           let User =
                               ["id" : UserDetails,
                                "Name ": self.Name.text! as String,
                                "UserEmail" : self.Email.text! as String ]
                           
                           self.user.child(UserDetails!).setValue(User)
                           
                         self.performSegue(withIdentifier: "MainPage", sender: self)
                           
                   
    }
                        else{
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
}


}
}
}
}
