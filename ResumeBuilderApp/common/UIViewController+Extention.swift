//
//  UIViewController+Extention.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 20/03/22.
//

import UIKit

extension UIViewController {
    func showAlert(title: String? = nil, message: String ) {
        let alertVc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVc.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alertVc, animated: true, completion: nil)
    }
}
