//
//  String+Extentions.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 20/03/22.
//

import UIKit

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


extension Date {
    var formatedDate : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yy"
        return dateFormatter.string(from: self)
    }
}
