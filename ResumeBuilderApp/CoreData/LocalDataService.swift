//
//  LocalDataService.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 11/03/22.
//

import Foundation


public protocol LocalDataService {
    func createData(input: Resume, completion: @escaping ()->Void)
    func fetchData(completion: @escaping ([Resume])->Void)
    func updateData(index: Int, input: Resume, completion: @escaping ()->Void)
    func deleteData(index: Int, completion: @escaping ()->Void)
}
