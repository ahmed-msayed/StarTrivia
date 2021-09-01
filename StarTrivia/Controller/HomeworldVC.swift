//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 29/08/2021.
//

import UIKit

class HomeworldVC: UIViewController {

    var homeworldAPI = HomeworldAPI()
    
    var personPassed: Person!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeworldAPI.getHomeworld(url: personPassed.homeworld) { (homeworld) in
            if let homeworld = homeworld {
                self.setupView(homeworld: homeworld)
            }
        }
    }
    
    
    func setupView (homeworld: Homeworld) {
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }
}
