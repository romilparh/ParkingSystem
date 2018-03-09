//
//  LoginViewController.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-04.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import UIKit

let userInfoEntered = UserInfo()

class LoginViewController: UIViewController {

    @IBOutlet weak var userEMail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var rememberMe: UISwitch!
    
    var loggedIn: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        userDatabase.append(UserInfo("Romil","romilparhwal007@gmail.com","Romil123!")) // username, email, password
        userDatabase.append(UserInfo("Gagandeep Brar","gagandeepbrar@gmail.com","gagandeep"))
        userDatabase.append(UserInfo("Jagdeep","jagdeep9417@gmail.com","Jagdeep"))
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    // Remember Me Code
    // Persistent storage through userdefault objects
    @IBAction func signIn(_ sender: UIButton) {
        userInfoEntered.eMail = userEMail.text
        userInfoEntered.password = userPassword.text
        for i in userDatabase{
            if userInfoEntered.eMail == i.eMail && userInfoEntered.password == i.password{
                if(rememberMe.isOn){
                    userEMail.text = userInfoEntered.eMail
                    userPassword.text = userInfoEntered.password
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "homeNavigate")
                    self.present(newViewController, animated: true, completion: nil)
                    loggedIn = true
                } else{
                    userEMail.text = nil
                    userPassword.text = nil
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "homeNavigate")
                    self.present(newViewController, animated: true, completion: nil)
                    loggedIn = true
                }
            }
        }
        if loggedIn == false{
            let alertController = UIAlertController(
                title: "Wrong Details", message: "Wrong Password or EMail not registered", preferredStyle: .alert)
            let defaultAction = UIAlertAction(
                title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}
