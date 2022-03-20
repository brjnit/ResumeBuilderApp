//
//  DIContainer.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 11/03/22.
//
import UIKit

struct DIContainer{
    private let dependencies: ModuleDependencies
    init(dependencies: ModuleDependencies) {
        self.dependencies = dependencies
    }
    
    func makeFlowCoordinator() -> MainFlowCoordinator {
        return MainFlowCoordinator(dependencies: self)
    }
}

extension DIContainer: FlowCoordinatorDependencies {
    func makeMainViewController(closures: ChooseProfileClosures) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(identifier: "MainViewController") as? MainViewController else { return  UIViewController()}
        let repository = DefaultResumeRepository(service: dependencies.localDataService)
        vc.viewModel = ChooseProfileViewModel(repository: repository, closures: closures)
        vc.navigationItem.title = "Choose Profile"
        vc.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        return vc
    }
    
    func makeProfileViewController(closures: ProfileClosures, resume: Resume?) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController else { return  UIViewController()}
        
        let repository = DefaultResumeRepository(service: dependencies.localDataService)
        vc.viewModel = ProfileViewModel(resume: resume, repository: repository, closures: closures)
        vc.navigationItem.title = "Profile"
        return vc
    }
    
    func makePreviewViewController(resume: Resume) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(identifier: "PreviewViewController") as? PreviewViewController else { return  UIViewController()}

        vc.viewModel = PreviewViewModel(resume: resume)
        vc.navigationItem.title = "Preview Resume"
        return vc
    }    
}
