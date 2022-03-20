//
//  MainFlowCoordinator.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 11/03/22.
//

import UIKit

protocol FlowCoordinatorDependencies {
    func makeMainViewController(closures: ChooseProfileClosures) -> UIViewController
    func makeProfileViewController(closures: ProfileClosures, resume: Resume?) -> UIViewController
    func makePreviewViewController(resume: Resume) -> UIViewController
}

class MainFlowCoordinator {
    let dependencies: FlowCoordinatorDependencies
    var mainViewController: UIViewController?
    
    init(dependencies:FlowCoordinatorDependencies) {
        self.dependencies = dependencies
    }
    
    func start() {
        let closures = ChooseProfileClosures(navigateToCreateResume: navigateToCreateResume, navigateToEditResume: navigateToEditResume)
        mainViewController = dependencies.makeMainViewController(closures: closures)
    }
    
    func navigateToCreateResume() {
        let closures = ProfileClosures(navigateToPreview: navigateToPreview)
        let vc = dependencies.makeProfileViewController(closures: closures, resume: nil)
        mainViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToPreview(resume: Resume) {
        let vc = dependencies.makePreviewViewController(resume: resume)
        mainViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToEditResume(resume: Resume) {
        let closures = ProfileClosures(navigateToPreview: navigateToPreview)
        let vc = dependencies.makeProfileViewController(closures: closures, resume: resume)
        mainViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
