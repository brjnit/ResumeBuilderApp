//
//  ResumeRepository.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 11/03/22.
//

import Foundation

protocol ResumeRepository {
    func save(_ resume: Resume, with completion: @escaping (Result<Void, FileError>)->Void )
    func load(from fileName: String, with completion: @escaping (Result<Resume,FileError>)->Void )
    func loadAll(with completion: @escaping (Result<[Resume],FileError>)->Void )
    func delete(from fileName: String, with completion: @escaping (Result<Void,FileError>)->Void )
}

struct DefaultResumeRepository: ResumeRepository {
    let service: LocalDataService
    
    func save(_ resume: Resume, with completion: @escaping (Result<Void, FileError>)->Void ) {
        service.save(resume, with: resume.id.uuidString, with: completion)
    }
    
    func load(from fileName: String, with completion: @escaping (Result<Resume,FileError>)->Void ) {
        service.load(fileName, type: Resume.self, with: completion)
    }
    
    func loadAll(with completion: @escaping (Result<[Resume],FileError>)->Void ) {
        service.loadAll(Resume.self, with: completion)
    }
    
    func delete(from fileName: String, with completion: @escaping (Result<Void,FileError>)->Void ) {
        service.delete(fileName, with: completion)
    }
}
