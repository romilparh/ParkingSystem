//
//  PasswordChangeViewController.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-04.
//  Copyright © 2018 ShadyBond. All rights reserved.
//
import UIKit

class PasswordChangeViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func passwordChange(_ sender: UIButton) {
        for i in userDatabase{
            if i.eMail == eMailEnteredbyUser{
                i.password = password.text
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginView")
                self.present(newViewController, animated: true, completion: nil)
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
}
