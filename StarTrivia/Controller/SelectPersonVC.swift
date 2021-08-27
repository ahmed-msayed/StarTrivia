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
//    @IBOutlet weak var homeworldBtn: UIButton!
//    @IBOutlet weak var vehiclesBtn: UIButton!
//    @IBOutlet weak var starshipsBtn: UIButton!
//    @IBOutlet weak var filmsBtn: UIButton!
    
    var personAPI = PersonAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        personAPI.getRandomPersonAlamofire()
    }

    @IBAction func randomBtnClicked(_ sender: Any) {
        let randomId = Int.random(in: 1 ... 82)
        
        personAPI.getRandomPersonAlamofire(id: randomId) { (person) in
            if let person = person {
                self.nameLbl.text = person.name
                self.heightLbl.text = person.height
                self.massLbl.text = person.mass
                self.hairLbl.text = person.hairColor
                self.birthYearLbl.text = person.birthYear
                self.genderLbl.text = person.gender
            }
        }
    }
    
}

