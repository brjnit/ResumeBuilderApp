//
//  CoreDataManager.swift
//  ResumeBuilderApp
//
//  Created by Brajesh Kumar on 11/03/22.
//

import UIKit
import CoreData

public class CoreDataManager: LocalDataService {
    static let shareInstance = CoreDataManager()
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
    
    
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
//        func saveImage(data: Data) {
//            let imageInstance = Image(context: context)
//            imageInstance.img = data
//                
//            do {
//                try context.save()
//                print("Image is saved")
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        
//        func fetchImage() -> [Image] {
//            var fetchingImage = [Image]()
//            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
//            
//            do {
//                fetchingImage = try context.fetch(fetchRequest) as! [Image]
//            } catch {
//                print("Error while fetching the image")
//            }
//            
//            return fetchingImage
//        }
}
