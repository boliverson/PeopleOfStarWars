//
//  EntityInteractor.swift
//  PeopleOfStarWars
//
//  Created by Ben Oliverson on 12/7/19.
//  Copyright © 2019 Ben Oliverson. All rights reserved.
//

import Foundation

import Foundation
import UIKit
import CoreData

class EntityInteractor: NSObject {
    
    class func getEntityWithId(entityName: String, entityId: Int16) -> Any? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        request.entity = entity
        let predicate = NSPredicate.init(format: "id = %d", entityId)
        request.predicate = predicate
        
        var result: Any = ()
        var items: [Any] = []
        
        context.persistentStoreCoordinator?.performAndWait {
            do{
                items = try context.fetch(request)
            }catch{
                print(error)
            }
        }
        
        if items.count > 0 {
            result = items[0]
        }
        return result
    }
    
    class func getEntityWithPredicate(entityName: String, predicate: String) -> Any {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        request.entity = entity
        let predicate = NSPredicate.init(format: predicate)
        request.predicate = predicate
        
        var items: [Any] = []
        
        context.persistentStoreCoordinator?.performAndWait {
            do{
                items = try context.fetch(request)
            }catch{
                print(error)
            }
        }
        
        return items
    }
    
}
