//
//  AddTicketViewController.swift
//  ParkingSystemBugPACers
//
//  Created by Romil Parhwal on 2018-03-08.
//  Copyright © 2018 ShadyBond. All rights reserved.
//

import UIKit

class AddTicketViewController: UIViewController{
    
    @IBOutlet weak var vehicleNumber: UITextField!
    @IBOutlet weak var carMake: UITextField!
    @IBOutlet weak var carColor: UITextField!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var parkingLane: UITextField!
    @IBOutlet weak var parkingSlot: UITextField!
    @IBOutlet weak var paymentMethod: UITextField!
    
    var newTicket = ParkingTicket()
    
    var allValuesEntered: Bool = false
    @IBOutlet weak var labelPrice: UILabel!

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let dateString = dateFormatter.string(from:date as Date)
        labelDate.text = dateString
        labelPrice.text = "$5"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var image = UIImage(named: "save.png")
        image = image?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(addTicket))
    }
    
    @IBAction func segmentTimeSelection(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            newTicket.timeTicket = 30
            newTicket.price = 5
            labelPrice.text = "$\(newTicket.price)"
        }
        else if sender.selectedSegmentIndex == 1{
            newTicket.timeTicket = 60
            newTicket.price = 7
            labelPrice.text = "$\(newTicket.price)"
        } else if sender.selectedSegmentIndex == 2{
            newTicket.timeTicket = 120
            newTicket.price = 10
            labelPrice.text = "$\(newTicket.price)"
        } else if sender.selectedSegmentIndex == 3{
            newTicket.timeTicket = 180
            newTicket.price = 15
            labelPrice.text = "$\(newTicket.price)"
        } else if sender.selectedSegmentIndex == 4{
            newTicket.timeTicket = 24*60
            newTicket.price = 20
            labelPrice.text = "$\(newTicket.price)"
        }
    }
    
    @objc func addTicket(){
        newTicket.userEMail = userInfoEntered.eMail
            print(parkingLane.text)
       
        
        if(carColor.text!.count != 0 && carMake.text!.count != 0 && parkingLane.text!.count != 0 && parkingSlot.text!.count != 0 && paymentMethod.text!.count != 0 && vehicleNumber.text!.count != 0){
            allValuesEntered = true
        }
        if(allValuesEntered){
            newTicket.carColor = carColor.text!
            newTicket.carMake = Int(carMake.text!)!
            newTicket.parkingLane = Int(parkingLane.text!)!
            newTicket.parkingNumber = Int(parkingSlot.text!)!
            newTicket.paymentMethod = paymentMethod.text!
            newTicket.vehicleNumber = vehicleNumber.text!
            parkingTickets.append(newTicket)
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "homeNavigate")
            self.present(newViewController, animated: true, completion: nil)
            
        } else{
            let alertController = UIAlertController(
                title: "Enter All Details", message: "All Values must be defined before adding the ticket", preferredStyle: .alert)
            let defaultAction = UIAlertAction(
                title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }

    }

}
