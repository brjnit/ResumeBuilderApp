//
//  CoreDataManager.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 11/03/22.
//

import UIKit
import CoreData


//Can handle saving of data usong core data or through API
//for demo purpose and of limited understanding in relationship Core data I have handle using local cache

public class LocalDataManager: LocalDataService {
    static let shareInstance = LocalDataManager()
    private var resumes: [Resume] = []
    
    public func createData(input: Resume, completion: @escaping ()->Void) {
        resumes.append(input)
        completion()
    }
    
    public func fetchData(completion: @escaping ([Resume])->Void) {
        completion(resumes)
    }
    
    public func updateData(index: Int, input: Resume, completion: @escaping () -> Void) {
        resumes[index] = input
        completion()
    }
    
    public func deleteData(index: Int, completion: @escaping () -> Void) {
        resumes.remove(at: index)
        completion()
    }
}
