//
//  CodeControllerViewController.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-04.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import UIKit

// Pass the object, not the value, it needs objects

class CodeControllerViewController: UIViewController {

    @IBOutlet weak var codeEntered: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }

    @IBAction func continueToChangePassword(_ sender: Any) {
        let codePassed: Int = Int(codeEntered.text!)!
        if (codePassed == recoveryGrid){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "passwordChange")
        self.present(newViewController, animated: true, completion: nil)
        // if passed code is equal to emailed, continue
        } else {
            let alertController = UIAlertController(
                title: "Wrong Code", message: "Code Entered is wrong, please try again", preferredStyle: .alert)
            let defaultAction = UIAlertAction(
                title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}

