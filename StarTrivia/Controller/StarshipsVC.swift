//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 29/08/2021.
//

import UIKit

class StarshipsVC: UIViewController {

    var personPassed: Person!
    var starshipsArr = [String]()
    let starshipsAPI = StarshipsAPI()
    var currentStarship = 0
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passLbl: UILabel!
    @IBOutlet weak var cargoLbl: UILabel!
    @IBOutlet weak var consLbl: UILabel!
    @IBOutlet weak var catLbl: UILabel!
    @IBOutlet weak var prevBtn: FadeEnabledBtn!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starshipsArr = personPassed.starshipUrls
        
        prevBtn.isEnabled = false
        nextBtn.isEnabled = starshipsArr.count > 1
        
        guard let firstStarship = starshipsArr.first else { return }
        getStarshipFromAPI(url: firstStarship)
    }
    
    
    func getStarshipFromAPI (url: String) {
        starshipsAPI.getStarships(url: url) { (starships) in
            if let starships = starships {
                self.setupView(starships: starships)
            }
        }
    }
    
    func setupView (starships: Starships) {
        nameLbl.text = starships.name.lenghtTwenty
        modelLbl.text = starships.model.lenghtTwenty
        manLbl.text = starships.manufacturer.lenghtTwelve
        costLbl.text = starships.cost
        speedLbl.text = starships.speed
        crewLbl.text = starships.crew
        passLbl.text = starships.passengers
        cargoLbl.text = starships.cargo
        consLbl.text = starships.consumables
        catLbl.text = starships.category
    }
    
    @IBAction func prevBtnClick(_ sender: Any) {
        currentStarship -= 1
        setPrevNextBtnState()
    }
    
    @IBAction func nextBtnClick(_ sender: Any) {
        currentStarship += 1
        setPrevNextBtnState()
    }
    
    func setPrevNextBtnState () {
        prevBtn.isEnabled = currentStarship == 0 ? false : true
        nextBtn.isEnabled = currentStarship == starshipsArr.count - 1 ? false : true
        
        getStarshipFromAPI(url: starshipsArr[currentStarship])
    }
}
