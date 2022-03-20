//
//  Module.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 11/03/22.
//

import UIKit

public struct ModuleDependencies {
    let localDataService: LocalDataService
    public init(localDataService: LocalDataService) {
        self.localDataService = localDataService
    }
}

public struct Module {
    private let diContainer: DIContainer
    public init(dependencies: ModuleDependencies) {
        self.diContainer = DIContainer(dependencies: dependencies)
    }
    
    public func makeRootViewController() -> UIViewController {
        let coordinator = diContainer.makeFlowCoordinator()
        coordinator.start()
        return coordinator.mainViewController ?? UIViewController()
        
    }
}
