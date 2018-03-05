//
//  LoginViewController.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-04.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEMail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var rememberMe: UISwitch!
    
    var userInfoEntered = UserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signUp(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "signUp")
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func forgotPassword(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "recoveryView")
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        userInfoEntered.eMail = userEMail.text
        userInfoEntered.password = userPassword.text
        for i in userDatabase{
            if userInfoEntered.eMail == i.eMail && userInfoEntered.password == i.password{
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "homeNavigate")
                self.present(newViewController, animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(
                    title: "Details Issue", message: "Either this eMail not registered or password is wrong", preferredStyle: .alert)
                let defaultAction = UIAlertAction(
                    title: "OK", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }
        }
        
    }
}
