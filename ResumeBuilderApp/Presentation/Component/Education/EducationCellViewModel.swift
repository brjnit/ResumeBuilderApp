//
//  EducationCellViewModel.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 10/03/22.
//

import Foundation

struct EducationCellViewModel {
    let instituteName: String?
    let course: String?
    let passingYear: String?
    let cgpa: String?
}

extension EducationCellViewModel: ComponentCellViewModelType {}
