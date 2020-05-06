//
//  StoreButton.swift
//  nikeTest
//
//  Created by karthik yalamanchili on 5/5/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import UIKit

class StoreButton: UIButton {

    override init(frame: CGRect) {
        super .init(frame: frame)
        SetUpButton ()
    }

    required init?(coder adecoder: NSCoder) {
        super .init(coder: adecoder)
        storeButtoncosmetics()
    }

    // setup button
    func SetUpButton (){

        //call a private function so others classes can't call this function.
        storeButtoncosmetics()

    }


    private func storeButtoncosmetics() {
        // Implement button changes
        layer.cornerRadius = 28
        layer.opacity = 0.8
        layer.backgroundColor = UIColor.black.cgColor
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        setTitleColor(UIColor.systemPink, for: .normal)
        setTitle("  Music ", for: .normal)
        layer.cornerRadius = 20.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 5.0, height: 20.0  )
        layer.shadowRadius = 15.0
        layer.shadowOpacity = 1.0
        isUserInteractionEnabled = true

    }

}


public   extension UILabel {

    func SetUpLabel (){
        font  = UIFont.systemFont(ofSize: 15, weight: .medium)
        textColor = UIColor.white
        numberOfLines = 4
        sizeToFit()
        layer.cornerRadius = 8.0
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0  )
        layer.shadowRadius = 15.0
        layer.shadowOpacity = 1.0
        clipsToBounds = true

    }
}



