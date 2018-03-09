//
//  EditProfileViewController.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-08.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var newPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func updatePassword(_ sender: UIButton) {
        for i in userDatabase{
            if i.eMail == userInfoEntered.eMail{
                i.password = newPassword.text
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "homeNavigate")
                self.present(newViewController, animated: true, completion: nil)
            }
        }
    }
    
}
