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
    
   fileprivate func getDocumentDirectory() -> URL {
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return url
        } else {
            fatalError("file Not found")
        }
    }
    
    public func save<T: Encodable>(_ object: T, with fileName: String, with completion: @escaping (Result<Void, FileError>)->Void) {
        let url = getDocumentDirectory().appendingPathComponent(fileName,isDirectory: false)
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch {
            completion(.failure(.parsingError))
        }
    }
    
    public func load<T: Decodable>(_ fileName: String, type: T.Type, with completion: @escaping (Result<T,FileError>)->Void) {
        let url = getDocumentDirectory().appendingPathComponent(fileName,isDirectory: false)
        if !FileManager.default.fileExists(atPath: url.path) {
            completion(.failure(.fileNotFound))
        }
        if let data = FileManager.default.contents(atPath: url.path){
            do {
                let model = try JSONDecoder().decode(type, from: data)
                completion(.success(model))
                
            } catch {
                completion(.failure(.parsingError))
            }
        } else {
            completion(.failure(.fileNotFound))
        }
    }
    
    public func loadAll<T: Decodable>(_ type: T.Type, with completion: @escaping (Result<[T],FileError>)->Void ) {
        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: getDocumentDirectory().path)
            var modelObjects: [T] = [T]()
            for fileName in files {
                load(fileName, type: type) { result in
                    switch result {
                    case .success(let model): modelObjects.append(model)
                    case .failure(_) : completion(.failure(.cannotLoadFile))
                        break
                    }
                }
            }
            completion(.success(modelObjects))
        } catch {
            completion(.failure(.fileNotFound))
        }
    }
    
    public func delete(_ fileName: String, with completion: @escaping (Result<Void,FileError>)->Void) {
        let url = getDocumentDirectory().appendingPathComponent(fileName,isDirectory: false)
        if FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.removeItem(at: url)
                completion(.success(()))
            } catch  {
                completion(.failure(.canNotRemove))
            }
        } else {
            completion(.failure(.fileNotFound))
        }
    }
}
