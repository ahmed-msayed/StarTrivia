//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 29/08/2021.
//

import UIKit

class VehiclesVC: UIViewController {
    
    var personPassed: Person!
    let vehiclesAPI = VehiclesAPI()
    var vehiclesArr = [String]()
    var currentVehicle = 0
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var prevBtn: BlackBgButton!
    @IBOutlet weak var nextBtn: BlackBgButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehiclesArr = personPassed.vehicleUrls
        
        prevBtn.isEnabled = false
        nextBtn.isEnabled = vehiclesArr.count > 1
        
        guard let firstVehicle = vehiclesArr.first else { return }
        getVehicleFromAPI(url: firstVehicle)
    }
    
    
    func getVehicleFromAPI (url: String) {
        vehiclesAPI.getVehicles(url: url) { (vehicles) in
            if let vehicles = vehicles {
                self.setupView(vehicles: vehicles)
            }
        }
    }
    
    func setupView (vehicles: Vehicles) {
        nameLbl.text = vehicles.name
        modelLbl.text = vehicles.model
        manLbl.text = vehicles.manufacturer
        costLbl.text = vehicles.cost
        lengthLbl.text = vehicles.length
        speedLbl.text = vehicles.speed
        crewLbl.text = vehicles.crew
        passengersLbl.text = vehicles.passengers
    }
    
    @IBAction func prevBtnClick(_ sender: Any) {
        currentVehicle -= 1
        setPrevNextBtnState()
    }
    
    @IBAction func nextBtnClick(_ sender: Any) {
        currentVehicle += 1
        setPrevNextBtnState()
    }
    
    func setPrevNextBtnState () {
//        if currentVehicle == 0 {
//            prevBtn.isEnabled = false
//        } else {
//            prevBtn.isEnabled = true
//        }
//
//        if currentVehicle == vehiclesArr.count - 1 {
//            nextBtn.isEnabled = false
//        } else {
//            nextBtn.isEnabled = true
//        }
        
        prevBtn.isEnabled = currentVehicle == 0 ? false : true
        nextBtn.isEnabled = currentVehicle == vehiclesArr.count - 1 ? false : true
        
        getVehicleFromAPI(url: vehiclesArr[currentVehicle])
    }
}
