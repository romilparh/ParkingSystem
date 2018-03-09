//
//  ParkingTicket.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-08.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import Foundation

class ParkingTicket{
    var userEMail: String
    var price: Int
    var vehicleNumber: String
    var carMake: Int
    var carColor: String
    var timeTicket: Float
    var parkingLane: Int
    var parkingNumber: Int
    var paymentMethod: String
    
    init(){
        self.userEMail = ""
        self.vehicleNumber = ""
        self.carMake = 0
        self.carColor = ""
        self.timeTicket = 0
        self.parkingLane = 0
        self.parkingNumber = 0
        self.paymentMethod = ""
        self.price = 0
    }
    
    init(_ userEMail: String,_ vehicleNumber: String,_ carMake: Int,_ carColor: String,_ timeTicket: Float,_ parkingLane: Int,_ parkingNumber: Int,_ paymentMethod: String,_ price: Int){
        self.userEMail = userEMail
        self.vehicleNumber = vehicleNumber
        self.carMake = carMake
        self.carColor = carColor
        self.timeTicket = timeTicket
        self.parkingLane = parkingLane
        self.parkingNumber = parkingNumber
        self.paymentMethod = paymentMethod
        self.price = price
    }
    
    func addTicket(_ userEMail: String,_ vehicleNumber: String,_ carMake: Int,_ carColor: String,_ timeTicket: Float,_ parkingLane: Int,_ parkingNumber: Int,_ paymentMethod: String,_ price: Int){
        self.userEMail = userEMail
        self.vehicleNumber = vehicleNumber
        self.carMake = carMake
        self.carColor = carColor
        self.timeTicket = timeTicket
        self.parkingLane = parkingLane
        self.parkingNumber = parkingNumber
        self.paymentMethod = paymentMethod
        self.price = price
    }
}

var parkingTickets = [ParkingTicket]()
