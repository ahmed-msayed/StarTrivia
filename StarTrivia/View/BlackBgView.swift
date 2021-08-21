//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 20/08/2021.
//

import UIKit

class BlackBgView: UIView {
    
    override func awakeFromNib() {
        layer.backgroundColor = Constants.BLACK_BG
        layer.cornerRadius = 15
    }
}


class BlackBgButton: UIButton {
    
    override func awakeFromNib() {
        layer.backgroundColor = Constants.BLACK_BG
        layer.cornerRadius = 15
    }
}
