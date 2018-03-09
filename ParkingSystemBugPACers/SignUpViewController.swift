//
//  SignUpViewController.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-04.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var eMailEntered: UITextField!
    @IBOutlet weak var passwordEntered: UITextField!
    var noUser: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginView")
        self.present(newViewController, animated: true, completion: nil)
    }
    
    // Transit to login after pressing OK on alert
    @IBAction func signUp(_ sender: UIButton) {
        let userInfoEntered = UserInfo()
        for i in userDatabase{
            if eMailEntered.text == i.eMail {
                noUser = false
            }
        }
        if(noUser == true){
            let eMailCheck: Bool = userInfoEntered.addUser(fullName.text!, eMailEntered.text!, passwordEntered.text!)
            if (eMailCheck == true){
                userDatabase.append(userInfoEntered)
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginView")
                self.present(newViewController, animated: true, completion: nil)
                let alertController = UIAlertController(
                    title: "Sign Up Successful", message: "You may now login", preferredStyle: .alert)
                let defaultAction = UIAlertAction(
                    title: "OK", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }
            else{
                let alertController = UIAlertController(
                    title: "Sign Up Not Successful", message: "eMail entered not valid", preferredStyle: .alert)
                let defaultAction = UIAlertAction(
                    title: "OK", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }
        } else {
            let alertController = UIAlertController(
                title: "Sign Up Not Successful", message: "User already registered with eMail entered", preferredStyle: .alert)
            let defaultAction = UIAlertAction(
                title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}
