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


public protocol LocalDataService {
    func createData(input: Resume, completion: @escaping ()->Void)
    func fetchData(completion: @escaping ([Resume])->Void)
    func updateData(index: Int, input: Resume, completion: @escaping ()->Void)
    func deleteData(index: Int, completion: @escaping ()->Void)
}

protocol ResumeRepository {
    func createData(input: Resume, completion: @escaping ()->Void)
    func fetchData(completion: @escaping ([Resume])->Void)
    func updateData(index: Int, input: Resume, completion: @escaping ()->Void)
    func deleteData(index: Int, completion: @escaping ()->Void)
}

struct DefaultResumeRepository: ResumeRepository {
    let service: LocalDataService
    public func createData(input: Resume, completion: @escaping ()->Void) {
        service.createData(input: input, completion: completion)
    }
    
    public func fetchData(completion: @escaping ([Resume])->Void) {
        service.fetchData(completion: completion)
    }
    
    public func updateData(index: Int, input: Resume, completion: @escaping () -> Void) {
        service.updateData(index: index, input: input, completion: completion)
    }
    
    public func deleteData(index: Int, completion: @escaping () -> Void) {
        service.deleteData(index: index, completion: completion)
    }
}
