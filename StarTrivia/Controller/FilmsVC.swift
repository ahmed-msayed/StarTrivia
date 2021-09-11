//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 29/08/2021.
//

import UIKit

class FilmsVC: UIViewController {

    var personPassed: Person!
    
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
    }
    
    
    
    
    @IBAction func prevBtnClick(_ sender: Any) {
        setPrevNextBtnState()
    }
    @IBAction func nextBtnClick(_ sender: Any) {
        setPrevNextBtnState()
    }
    
    func setPrevNextBtnState () {

    }
}
