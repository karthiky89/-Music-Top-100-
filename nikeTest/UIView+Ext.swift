//
//  UIView+Ext.swift
//  nikeTest
//
//  Created by karthik yalamanchili on 5/4/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import UIKit

extension UIView {
    
    func pin (to superview: UIView) {
        translatesAutoresizingMaskIntoConstraints                               = true
        topAnchor.constraint(equalTo: superview.topAnchor).isActive             = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive     = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive   = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive       = true
        
    }
}

// extention to add consyraints for a view to super view
