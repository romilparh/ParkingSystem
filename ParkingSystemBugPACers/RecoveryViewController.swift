//
//  RecoveryViewController.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-04.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

var recoveryGrid: Int = 0
var eMailEnteredbyUser: String!

class RecoveryViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var eMailEntered: UITextField!
    let recoveryInteger: Int = 1000

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
    }
    func sendEmail() {
        eMailEnteredbyUser = eMailEntered.text
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        // Configure the fields of the interface.
        composeVC.setToRecipients(["\(eMailEntered.text)"])
        composeVC.setSubject("Hello!")
        composeVC.setMessageBody("Hello, your recovery code is \(recoveryGrid).", isHTML: false)
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "codeController")
        self.present(newViewController, animated: true, completion: nil)
    }
    

    @IBAction func gotoLogin(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginView")
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func recoverEMail(_ sender: UIButton) {
        let randomNo: Int = Int(arc4random_uniform(8999))
        print(randomNo)
        recoveryGrid = recoveryInteger + randomNo
        print(recoveryGrid)
        
        for i in userDatabase{
            if(eMailEntered.text == i.eMail){
                // pass the code to next screen for updation of password
                // pass the user email to third screen to update the password
                // Send Recovery Code EMail
                sendEmail()
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "codeController")
                // newViewController.codePassed = recoveryGrid
                self.present(newViewController, animated: true, completion: nil)
            }
            else {
                let alertController = UIAlertController(
                    title: "Details Issue", message: "eMail not registered with service", preferredStyle: .alert)
                let defaultAction = UIAlertAction(
                    title: "OK", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
}
