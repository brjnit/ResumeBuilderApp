//
//  ResumeRepository.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 20/03/22.
//

import Foundation

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
