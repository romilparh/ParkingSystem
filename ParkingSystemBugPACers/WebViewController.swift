//
//  WebViewController.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-09.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var instructionWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            guard let filePath = Bundle.main.path(forResource: "instuctions", ofType: "html")
                else {
                    // File Error
                    print ("File reading error")
                    return
            }
            
            let contents =  try String(contentsOfFile: filePath, encoding: .utf8)
            print(contents)
            let baseUrl = URL(fileURLWithPath: filePath)
            instructionWebView.loadHTMLString(contents as String, baseURL: baseUrl)
        }
        catch {
            print ("File HTML error")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var image = UIImage(named: "home.png")
        image = image?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(btnDoneAction))
    }
    
    @objc func btnDoneAction(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "homeNavigate")
        self.present(newViewController, animated: true, completion: nil)
    }
}
