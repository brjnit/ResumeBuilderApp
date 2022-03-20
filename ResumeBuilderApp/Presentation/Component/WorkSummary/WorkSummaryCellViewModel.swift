//
//  WorkSummaryCellViewModel.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 18/03/22.
//

import Foundation

struct WorkSummaryCellViewModel {
    let companyName: String?
    let duration: String?
}

extension WorkSummaryCellViewModel: ComponentCellViewModelType {}
