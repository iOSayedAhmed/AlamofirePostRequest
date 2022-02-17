//
//  ViewController.swift
//  AlamofirePostRequest
//
//  Created by Develop on 2/17/22.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class RegisterUserVC: UIViewController {
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var user : User!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerButtonClicked(_ sender: UIButton) {
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        UserAPI.regestirNewUser(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, email: email) { (userResponse, errorMSG) in
                 if errorMSG != nil {
                     // faluire
                     let alert = UIAlertController(title: "Error", message: errorMSG, preferredStyle: .alert)
                     let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                     alert.addAction(okAction)
                     self.present(alert, animated: true)
                     print(errorMSG)
                 }
                 else
                 { let alert = UIAlertController(title: "Success", message: errorMSG, preferredStyle: .alert)
                                    let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                                    alert.addAction(okAction)
                                    self.present(alert, animated: true)
                     self.user = userResponse
                     
                 }
             }
    }
    
    
    
}
