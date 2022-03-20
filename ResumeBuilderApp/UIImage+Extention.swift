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
extension String {
    
    func decodeBase64StringToImage() -> UIImage? {
        guard let data = Data(base64Encoded: self) else {return UIImage(systemName: "person.fill.viewfinder")}
        return UIImage(data: data) ?? UIImage(systemName: "person.fill.viewfinder")
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidPhoneNumber: Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
}

extension UITableViewCell {
    func addShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2.0
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
}

extension Date {
    var formatedDate : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yy"
        return dateFormatter.string(from: self)
    }
}

extension UIViewController {
    func showAlert(title: String? = nil, message: String ) {
        let alertVc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVc.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alertVc, animated: true, completion: nil)
    }
}


