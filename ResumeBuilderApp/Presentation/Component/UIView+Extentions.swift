//
//  UIView+Extentions.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 08/03/22.
//

import UIKit

extension UIView {
    func addConstraints(to view: UIView, top: CGFloat = 0, left: CGFloat=0, bottom: CGFloat=0, right: CGFloat=0) {
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: left).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: right).isActive = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
//    func addConstraints(topAnchor: NSLayoutConstraint, leftAnchor: NSLayoutConstraint, bottomAnchor: NSLayoutConstraint, rightAnchor: NSLayoutConstraint, top: CGFloat = 0, left: CGFloat=0, bottom: CGFloat=0, right: CGFloat=0) {
//        self.topAnchor.constraint(equalTo: topAnchor, constant: top).isActive = true
//        self.leadingAnchor.constraint(equalTo: leftAnchor, constant: left).isActive = true
//        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom).isActive = true
//        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: right).isActive = true
//        self.translatesAutoresizingMaskIntoConstraints = false
//    }
}
