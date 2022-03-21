//
//  ResumeRepositoryTests.swift
//  ResumeBuilderAppTests
//
//  Created by Brajesh Kumar on 21/03/22.
//

import XCTest
@testable import ResumeBuilderApp

class ResumeRepositoryTests: XCTestCase {

    func test_saveResumeWithSuccess() {
        let resume: Resume = Resume(id: UUID(), profileImage: nil, personalDetails: PersonalDetails(name: "Brajesh", address: "Patna", email: "brjnit2009@gmail.com", phone: "9703588647"), objective: nil, totalExperience: nil, workSummaries: [], skills: [], education: [], projects: [], createdAt: Date())
        let sut = makeSUT(with: resume, isSuccess: true)
        
        let expectation = self.expectation(description: "save resume successfully")
        var isSuccess: Bool = false
        sut.save(resume) { _ in
            expectation.fulfill()
            isSuccess = true
        }
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertTrue(isSuccess)
    }
    
    func test_saveResumeWithFailure() {
        let resume: Resume = Resume(id: UUID(), profileImage: nil, personalDetails: PersonalDetails(name: "Brajesh", address: "Patna", email: "brjnit2009@gmail.com", phone: "9703588647"), objective: nil, totalExperience: nil, workSummaries: [], skills: [], education: [], projects: [], createdAt: Date())
        let sut = makeSUT(with: resume, isSuccess: false)
        
        let expectation = self.expectation(description: "resume save failed")
        var isError: Bool = false
        sut.save(resume) { _ in
            expectation.fulfill()
            isError = true
        }
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertTrue(isError)
    }
    
    func test_loadResumeWithSuccess() {
        let resume: Resume = Resume(id: UUID(), profileImage: nil, personalDetails: PersonalDetails(name: "Brajesh", address: "Patna", email: "brjnit2009@gmail.com", phone: "9703588647"), objective: nil, totalExperience: nil, workSummaries: [], skills: [], education: [], projects: [], createdAt: Date())
        let sut = makeSUT(with: resume, isSuccess: true)
        let expectation = self.expectation(description: "load resume successfully")
        sut.save(resume) { (_) in
           //
        }
        var expectedResume: Resume?
        sut.load(from: resume.id.uuidString, with: { result in
            switch result {
            case .success(let response): expectedResume = response
            case .failure: XCTFail("load resume failed")
            }
            expectation.fulfill()
            
        })
       
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertEqual(expectedResume?.personalDetails?.name, resume.personalDetails?.name)
    }
    
    func test_loadResumeWithFailure() {
        let resume: Resume = Resume(id: UUID(), profileImage: nil, personalDetails: PersonalDetails(name: "Brajesh", address: "Patna", email: "brjnit2009@gmail.com", phone: "9703588647"), objective: nil, totalExperience: nil, workSummaries: [], skills: [], education: [], projects: [], createdAt: Date())
        let sut = makeSUT(with: resume, isSuccess: false)
        let expectation = self.expectation(description: "load resume failed")
      
        sut.save(resume) { (_) in
            //
        }
        var isError: Bool = false
        sut.load(from: UUID().uuidString, with: { result in
            expectation.fulfill()
            switch result {
            case .success: XCTFail("load resume should not success")
            case .failure: isError = true
            }
            
        })
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertTrue(isError)
    }
    
    func test_loadAllResumeWithSuccess() {
        let resume: Resume = Resume(id: UUID(), profileImage: nil, personalDetails: PersonalDetails(name: "Brajesh", address: "Patna", email: "brjnit2009@gmail.com", phone: "9703588647"), objective: nil, totalExperience: nil, workSummaries: [], skills: [], education: [], projects: [], createdAt: Date())
        let sut = makeSUT(with: resume, isSuccess: true)
        let expectation = self.expectation(description: "load all resume successfully")
        sut.save(resume) { (_) in
           //
        }
        var expectedResume: [Resume] = []
        sut.loadAll(with: { result in
            switch result {
            case .success(let response): expectedResume = response
            case .failure: XCTFail("load all resume failed")
            }
            expectation.fulfill()
            
        })
       
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertEqual(expectedResume.count, 1)
    }
    
    func test_loadAllResumeWithFailure() {
        let resume: Resume = Resume(id: UUID(), profileImage: nil, personalDetails: PersonalDetails(name: "Brajesh", address: "Patna", email: "brjnit2009@gmail.com", phone: "9703588647"), objective: nil, totalExperience: nil, workSummaries: [], skills: [], education: [], projects: [], createdAt: Date())
        let sut = makeSUT(with: resume, isSuccess: false)
        let expectation = self.expectation(description: "load all resume failed")
      
        sut.save(resume) { (_) in
            //
        }
        var isError: Bool = false
        sut.load(from: UUID().uuidString, with: { result in
            expectation.fulfill()
            switch result {
            case .success: XCTFail("load all resume should not success")
            case .failure: isError = true
            }
            
        })
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertTrue(isError)
    }
    
    func test_deleteResumeWithSuccess() {
        let resume: Resume = Resume(id: UUID(), profileImage: nil, personalDetails: PersonalDetails(name: "Brajesh", address: "Patna", email: "brjnit2009@gmail.com", phone: "9703588647"), objective: nil, totalExperience: nil, workSummaries: [], skills: [], education: [], projects: [], createdAt: Date())
        let sut = makeSUT(with: resume, isSuccess: true)
        let expectation = self.expectation(description: "delete resume successfully")
        sut.save(resume) { (_) in
           //
        }
        var isSuccess: Bool = false
        sut.delete(from: resume.id.uuidString, with: { result in
            switch result {
            case .success: isSuccess = true
            case .failure: XCTFail("delete resume failed")
            }
            expectation.fulfill()
            
        })
       
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertTrue(isSuccess)
    }
    
    func test_deleteResumeWithFailure() {
        let resume: Resume = Resume(id: UUID(), profileImage: nil, personalDetails: PersonalDetails(name: "Brajesh", address: "Patna", email: "brjnit2009@gmail.com", phone: "9703588647"), objective: nil, totalExperience: nil, workSummaries: [], skills: [], education: [], projects: [], createdAt: Date())
        let sut = makeSUT(with: resume, isSuccess: false)
        let expectation = self.expectation(description: "delete resume failed")
      
        sut.save(resume) { (_) in
            //
        }
        var isError: Bool = false
        sut.delete(from: UUID().uuidString, with: { result in
            expectation.fulfill()
            switch result {
            case .success: XCTFail("delete resume should not success")
            case .failure: isError = true
            }
            
        })
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertTrue(isError)
    }
    
    private func makeSUT(with resume: Resume, isSuccess: Bool = true) -> ResumeRepository {
        return DefaultResumeRepository(service: MockLocalDataService(isSuccess: isSuccess, resume: resume))
    }
}


fileprivate struct MockLocalDataService: LocalDataService {
    var isSuccess: Bool = true
    let resume: Resume
    
    func save<T>(_ object: T, with fileName: String, with completion: @escaping (Result<Void, FileError>) -> Void) where T : Encodable {
        if isSuccess {
            completion(.success(()))
        } else {
            completion(.failure(.fileNotFound))
        }
    }
    
    func load<T>(_ fileName: String, type: T.Type, with completion: @escaping (Result<T, FileError>) -> Void) where T : Decodable {
        if isSuccess {
            completion(.success((resume) as! T))
        } else {
            completion(.failure(.fileNotFound))
        }
    }
    
    func loadAll<T>(_ type: T.Type, with completion: @escaping (Result<[T], FileError>) -> Void) where T : Decodable {
        if isSuccess {
            let resumes: [T] = [resume as! T]
            completion(.success((resumes)))
        } else {
            completion(.failure(.fileNotFound))
        }
    }
    
    func delete(_ fileName: String, with completion: @escaping (Result<Void, FileError>) -> Void) {
        if isSuccess {
            completion(.success(()))
        } else {
            completion(.failure(.fileNotFound))
        }
    }
}
