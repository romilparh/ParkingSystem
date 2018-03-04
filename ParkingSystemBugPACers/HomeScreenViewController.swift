//
//  HomeScreenViewController.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-04.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    var sidebarView: SidebarView!
    var blackScreen: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newBtn = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(btnMenuAction))
        self.navigationItem.leftBarButtonItem = newBtn 
        sidebarView = SidebarView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.frame.height))
        sidebarView.delegate = self
        sidebarView.layer.zPosition=100
        self.view.isUserInteractionEnabled=true
        self.navigationController?.view.addSubview(sidebarView)
        
        blackScreen=UIView(frame: self.view.bounds)
        blackScreen.backgroundColor=UIColor(white: 0, alpha: 0.3)
        blackScreen.isHidden=true
        self.navigationController?.view.addSubview(blackScreen)
        blackScreen.layer.zPosition=99
        let tapGestRecognizer = UITapGestureRecognizer(target: self, action: #selector(blackScreenTapAction(sender:)))
        blackScreen.addGestureRecognizer(tapGestRecognizer)
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
      //  var image = UIImage(named: "Navigation.png")
      //  image = image?.withRenderingMode(.alwaysOriginal)
      //  self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: nil, action: nil)
        }
    
    @objc func btnMenuAction() {
        blackScreen.isHidden=false
        UIView.animate(withDuration: 0.3, animations: {
            self.sidebarView.frame=CGRect(x: 0, y: 0, width: 250, height: self.sidebarView.frame.height)
        }) { (complete) in
            self.blackScreen.frame=CGRect(x: self.sidebarView.frame.width, y: 0, width: self.view.frame.width-self.sidebarView.frame.width, height: self.view.bounds.height+100)
        }
    }
    
    @objc func blackScreenTapAction(sender: UITapGestureRecognizer) {
        blackScreen.isHidden=true
        blackScreen.frame=self.view.bounds
        UIView.animate(withDuration: 0.3) {
            self.sidebarView.frame=CGRect(x: 0, y: 0, width: 0, height: self.sidebarView.frame.height)
        }
    }

}

extension HomeScreenViewController: SidebarViewDelegate {
    func sidebarDidSelectRow(row: Row) {
        blackScreen.isHidden = true
        blackScreen.frame = self.view.bounds
        UIView.animate(withDuration: 0.3) {
            self.sidebarView.frame=CGRect(x: 0, y: 0, width: 0, height: self.sidebarView.frame.height)
            }
        switch row {
        case .editProfile:
            let vc=EditProfileVC()
            self.navigationController?.pushViewController(vc, animated: true)
        case .addTicket:
            print("Add Ticket")
        case .location:
            print("Location")
        case .contact:
            print("Contact")
        case .signOut:
            print("Sign out")
        case .none:
            break
            //        default:  //Default will never be executed
            //            break
        }
}
}
