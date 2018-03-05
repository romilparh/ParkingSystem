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
        // update password in userDatabase array by checking email
        // want to show alert and on pressing ok, it should navigate to login page
    }
}
