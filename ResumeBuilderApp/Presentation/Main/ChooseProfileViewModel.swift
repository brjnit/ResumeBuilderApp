//
//  ChooseProfileViewModel.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 16/03/22.
//

import Foundation


class ChooseProfileViewModel {
    let repository: ResumeRepository
    let closures:ChooseProfileClosures
    private var resumes: [Resume]?
    
    var didUpdate: (()-> Void)?
    var didFail: (()-> Void)?
    
    init(repository: ResumeRepository, closures: ChooseProfileClosures) {
        self.repository = repository
        self.closures = closures
    }
    
    var noOfRows: Int {
        resumes?.count ?? 0
    }
    
    func cellViewModel(for indexPath: IndexPath) -> ProfileCellModel? {
        guard let resumes = resumes, resumes.count > 0 else { return nil }
        let selectedResume = resumes[indexPath.row]
        return ProfileCellModel(profileImage: selectedResume.profileImage, name: selectedResume.personalDetails?.name, email: selectedResume.personalDetails?.email, contact: selectedResume.personalDetails?.phone, updatedDate: selectedResume.createdDate.formatedDate)
    }
    
    func fetchResumes() {
        repository.fetchData { [weak self] resumes in
            self?.resumes = resumes
            self?.didUpdate?()
        }
    }
    
    func createNewResume() {
        closures.createResume()
    }
    
    func didSelectRow(for indexPath: IndexPath) {
        guard let resume = resumes?[indexPath.row] else { return }
        closures.navigateToEditResume(resume)
    }
    
}

struct ChooseProfileClosures {
    var createResume: ()->Void
    var navigateToEditResume: (Resume)->Void
}
