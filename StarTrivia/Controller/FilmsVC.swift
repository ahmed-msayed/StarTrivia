//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 29/08/2021.
//

import UIKit

class FilmsVC: UIViewController {

    var personPassed: Person!
    var filmsArr = [String]()
    let filmsAPI = FilmsAPI()
    var currentFilm = 0
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var crawlText: UITextView!
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmsArr = personPassed.filmUrls
        
        prevBtn.isEnabled = false
        nextBtn.isEnabled = filmsArr.count > 1
        
        guard let firstFilm = filmsArr.first else { return }
        getFilmFromAPI(url: firstFilm)
    }
    
    func getFilmFromAPI (url: String) {
        filmsAPI.getFilms(url: url) { (films) in
            if let films = films {
                self.setupView(films: films)
            }
        }
    }
    
    func setupView (films: Films) {
        titleLbl.text = films.title
        episodeLbl.text = String(films.episode)
        directorLbl.text = films.director
        producerLbl.text = films.producer
        releasedLbl.text = films.release
        
        let strippedCrawl = films.crawl.replacingOccurrences(of: "\n", with: " ")
        crawlText.text = strippedCrawl.replacingOccurrences(of: "\r", with: "")
    }
    
    @IBAction func prevBtnClick(_ sender: Any) {
        currentFilm -= 1
        setPrevNextBtnState()
    }
    @IBAction func nextBtnClick(_ sender: Any) {
        currentFilm += 1
        setPrevNextBtnState()
    }
    
    func setPrevNextBtnState () {
        prevBtn.isEnabled = currentFilm == 0 ? false : true
        nextBtn.isEnabled = currentFilm == filmsArr.count - 1 ? false : true
        
        getFilmFromAPI(url: filmsArr[currentFilm])
    }
}
