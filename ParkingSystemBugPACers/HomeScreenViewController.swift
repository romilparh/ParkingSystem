//
//  HomeScreenViewController.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-04.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
      //  var image = UIImage(named: "Navigation.png")
      //  image = image?.withRenderingMode(.alwaysOriginal)
      //  self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: nil, action: nil)
        let newBtn = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = newBtn //self.navigationItem.leftBarButtonItems = [newBtn,anotherBtn]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
