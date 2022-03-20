//
//  UIImage+Extention.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 17/03/22.
//

import UIKit

extension UIImageView {
    func makeRounded() {
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
    }
}


