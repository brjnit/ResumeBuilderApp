//
//  UITableViewCell + Extentions.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 20/03/22.
//

import UIKit

extension UITableViewCell {
    func addShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2.0
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
}
