//
//  AddTicketViewController.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-08.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import UIKit

class AddTicketViewController: UIViewController {
    
    @IBOutlet weak var labelDate: UILabel!
    var parkingTicket = ParkingTicket()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from:date as Date)
        labelDate.text = dateString

    }

}
