//
//  SelectPersonVC.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 20/08/2021.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    
    var personAPI = PersonAPI()
    
    var personToPass: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomBtnClicked(_ sender: Any) {
        let randomId = Int.random(in: 1 ... 82)
        
        personAPI.getRandomPersonAlamofire(id: randomId) { (person) in
            if let person = person {
                self.setupView(person: person)
                self.personToPass = person
            }
        }
    }
    
    func setupView (person: Person) {
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hairColor
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        
        homeworldBtn.isEnabled = !person.homeworldUrl.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        starshipsBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.films.isEmpty
    }
    
    
    @IBAction func homeworldClicked(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeworldVC") as? HomeworldVC {
            self.navigationController?.pushViewController(viewController, animated: true)
            viewController.personPassed = personToPass
        }
    }
    @IBAction func vehiclesClicked(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VehiclesVC") as? VehiclesVC {
            self.navigationController?.pushViewController(viewController, animated: true)
            viewController.personPassed = personToPass
        }
    }
    @IBAction func starshipsClicked(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StarshipsVC") as? StarshipsVC {
            self.navigationController?.pushViewController(viewController, animated: true)
            viewController.personPassed = personToPass
        }
    }
    @IBAction func filmsClicked(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FilmsVC") as? FilmsVC {
            self.navigationController?.pushViewController(viewController, animated: true)
            viewController.personPassed = personToPass
        }
    }
    
    
    /*
     //if using segues, use prepare for segue with if and else if for each VC
     
     //also we van use Protocols with prepare for segue :
     
     
     var personToPass: Person!              //global var
     
     self.personToPass = person             //inside random btn
     
     protocol PersonProtocol {              //at the end of the VC
     var person: Person! {get set}
     }
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person
        }
     }
     
     //then conform all the view controllers to the Protocol
     */
}

