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
    var codePassed: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func continueToChangePassword(_ sender: Any) {
        print(codeEntered.text)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "passwordChange")
        self.present(newViewController, animated: true, completion: nil)
        // if passed code is equal to emailed, continue
    }
}

