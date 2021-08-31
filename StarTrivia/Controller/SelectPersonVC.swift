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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomBtnClicked(_ sender: Any) {
        let randomId = Int.random(in: 1 ... 82)
        
        personAPI.getRandomPersonAlamofire(id: randomId) { (person) in
            if let person = person {
                self.setupView(person: person)
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
        
        homeworldBtn.isEnabled = !person.homeworld.isEmpty
        vehiclesBtn.isEnabled = !person.vehicles.isEmpty
        starshipsBtn.isEnabled = !person.starships.isEmpty
        filmsBtn.isEnabled = !person.films.isEmpty
    }
    
    @IBAction func homeworldClicked(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeworldVC") as? HomeworldVC {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    @IBAction func vehiclesClicked(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VehiclesVC") as? VehiclesVC {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    @IBAction func starshipsClicked(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StarshipsVC") as? StarshipsVC {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    @IBAction func filmsClicked(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FilmsVC") as? FilmsVC {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}

