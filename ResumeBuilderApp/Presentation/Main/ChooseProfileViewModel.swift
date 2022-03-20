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
    var didFail: ((String)-> Void)?
    
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
        return ProfileCellModel(profileImage: selectedResume.profileImage, name: selectedResume.personalDetails?.name, email: selectedResume.personalDetails?.email, contact: selectedResume.personalDetails?.phone, updatedDate: selectedResume.createdAt.formatedDate)
    }
    
    func fetchResumes() {
        repository.loadAll(with: { [weak self]  result in
            switch result {
            case .success(let response):
                    self?.resumes = response
                    self?.didUpdate?()
            case .failure(let error):
                self?.didFail?(error.localizedDescription)
            }
        })
    }
    
    func createNewResume() {
        closures.navigateToCreateResume()
    }
    
    func didSelectRow(for indexPath: IndexPath) {
        guard let resume = resumes?[indexPath.row] else { return }
        closures.navigateToEditResume(resume)
    }
    
}

struct ChooseProfileClosures {
    var navigateToCreateResume: ()->Void
    var navigateToEditResume: (Resume)->Void
}
