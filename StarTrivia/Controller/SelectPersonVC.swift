//
//  SelectPersonVC.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 20/08/2021.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    var personAPI = PersonAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        personAPI.getRandomPersonUrlSession()
        personAPI.getRandomPersonAlamofire()
    }


}

