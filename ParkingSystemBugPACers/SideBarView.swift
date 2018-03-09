//
//  SideBarView.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-04.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import Foundation
import UIKit

protocol SidebarViewDelegate: class {
    func sidebarDidSelectRow(row: Row)
}

enum Row: String {
    case editProfile
    case contact
    case instruction
    case signOut
    case none
    
    init(row: Int) {
        switch row {
        case 0: self = .editProfile
        case 1: self = .contact
        case 2: self = .instruction
        case 3: self = .signOut
        default: self = .none
        }
    }
}

class SidebarView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var titleArr = [String]()
    var userName: String = ""
    
    weak var delegate: SidebarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
        self.clipsToBounds=true
        
        for i in userDatabase{
            if i.eMail == userInfoEntered.eMail{
                userName = i.fullName
            }
        }
        titleArr = ["\(userName)", "Contact Us", "Instructions", "Sign Out"]
        
        setupViews()
        
        myTableView.delegate=self
        myTableView.dataSource=self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myTableView.tableFooterView=UIView()
        myTableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        myTableView.allowsSelection = true
        myTableView.bounces=false
        myTableView.showsVerticalScrollIndicator=false
        myTableView.backgroundColor = UIColor.clear
    }
    // (red: 112/255, green: 191/255, blue: 78/255, alpha: 1.0)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        if indexPath.row == 0 {
            cell.backgroundColor=UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)

            let cellImg: UIImageView!
            cellImg = UIImageView(frame: CGRect(x: 15, y: 10, width: 80, height: 80))
            cellImg.layer.cornerRadius = 40
            cellImg.layer.masksToBounds=true
            cellImg.contentMode = .scaleAspectFill
            cellImg.layer.masksToBounds=true
            cellImg.image = UIImage(named: "Navigation.png")
            cell.addSubview(cellImg)
            
            let cellLbl = UILabel(frame: CGRect(x: 110, y: cell.frame.height/2-15, width: 250, height: 30))
            cell.addSubview(cellLbl)
            cellLbl.text = titleArr[indexPath.row]
            cellLbl.font=UIFont.systemFont(ofSize: 17)
            cellLbl.textColor=UIColor.darkGray
        } else {
            cell.textLabel?.text=titleArr[indexPath.row]
            cell.textLabel?.textColor=UIColor.darkGray
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.sidebarDidSelectRow(row: Row(row: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        } else {
            return 60
        }
    }
    
    func setupViews() {
        self.addSubview(myTableView)
        myTableView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        myTableView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        myTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        myTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
    }
    
    let myTableView: UITableView = {
        let table=UITableView()
        table.translatesAutoresizingMaskIntoConstraints=false
        return table
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


