//
//  LocalDataService.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 11/03/22.
//

import Foundation

public protocol LocalDataService {
    func save<T: Encodable>(_ object: T, with fileName: String, with completion: @escaping (Result<Void, FileError>)->Void)
    func load<T: Decodable>(_ fileName: String, type: T.Type, with completion: @escaping (Result<T,FileError>)->Void)
    func loadAll<T: Decodable>(_ type: T.Type, with completion: @escaping (Result<[T],FileError>)->Void )
    func delete(_ fileName: String, with completion: @escaping (Result<Void,FileError>)->Void)
}

public enum FileError: Error {
    case fileNotFound
    case cannotLoadFile
    case canNotRemove
    case parsingError
    
    var description: String {
        switch self {
        case .fileNotFound: return "file is not found in system"
        case .cannotLoadFile: return "Error occured while loading the file."
        case .canNotRemove: return "Error occured while removing"
        case .parsingError: return "Error occured in json parsing"
        }
    }
}
