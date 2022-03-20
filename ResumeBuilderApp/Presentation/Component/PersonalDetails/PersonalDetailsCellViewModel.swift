//
//  PersonalDetailsCellViewModel.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 10/03/22.
//

import Foundation

class PersonalDetailsCellViewModel {
    var name: String?
    var address: String?
    var email: String?
    var phone: String?
    var didUpdate: ((PersonalDetails)-> Void)?
    init(personalDetails: PersonalDetails?) {
        name = personalDetails?.name
        address = personalDetails?.address
        email = personalDetails?.email
        phone = personalDetails?.phone
    }
    func update(with text: String?, and field: PersonalDetailsTextField) {
        switch field {
        case .name: name = text
        case .address: address = text
        case .email: email = text
        case .phone: phone = text
        }
        let personalDetails = PersonalDetails(name: name, address: address, email: email, phone: phone)
        didUpdate?(personalDetails)
    }
}

extension PersonalDetailsCellViewModel: ComponentCellViewModelType {}
