//
//  UsedExtensions.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-04.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import Foundation

extension ViewController: SidebarViewDelegate {
    func sidebarDidSelectRow(row: Row) {
        blackScreen.isHidden=true
        blackScreen.frame=self.view.bounds
        UIView.animate(withDuration: 0.3) {
            self.sidebarView.frame=CGRect(x: 0, y: 0, width: 0, height: self.sidebarView.frame.height)
        }
        switch row {
        case .editProfile:
            let selectionItemView=HomeScreenViewController()
            self.navigationController?.pushViewController(selectionItemView, animated: true)
        case .home:
            print("Home")
        case .addTicket:
            print("Add Ticket")
        case .location:
            print("Location")
        case .instruction:
            print("Instruction")
        case .contact:
            print("Contact")
        case .signOut:
            print("Sign Out")
        case .none:
            break
            //        default:  //Default will never be executed
            //            break
        }
}
