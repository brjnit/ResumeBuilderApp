//
//  ProjectsCellViewModel.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 10/03/22.
//

import Foundation

struct ProjectsCellViewModel {
    let projectName: String?
    let teamSize: String?
    let role: String?
    let technologyUsed: String?
    let summury: String?
}

extension ProjectsCellViewModel: ComponentCellViewModelType {}
