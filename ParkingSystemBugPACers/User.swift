//
//  User.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-04.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import Foundation

class UserInfo{
    var fullName: String!
    var eMail: String!
    var password: String!
    
    var parkingTickets = [ParkingTicket]()
    
    init(){
        self.fullName = ""
        self.eMail = ""
        self.password = ""
    }
    
    init(_ userName: String,_ eMail: String,_ passwordEntered: String){
        self.fullName = userName
        self.eMail = eMail
        self.password = passwordEntered
    }
    func addUser(_ userName: String,_ eMail: String,_ passwordEntered: String) -> Bool{
        if(isValidEmail(eMail)){
            self.fullName = userName
            self.eMail = eMail
            self.password = passwordEntered
            return true
        } else {
            print("E-Mail not valid or already registered")
            return false
        }
    }
    
    func isValidEmail(_ testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+.com"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

}

var userDatabase = [UserInfo]()
// email as primary key

