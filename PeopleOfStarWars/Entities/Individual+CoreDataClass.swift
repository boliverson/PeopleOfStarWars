//
//  Individual+CoreDataClass.swift
//  PeopleOfStarWars
//
//  Created by Ben Oliverson on 12/7/19.
//  Copyright © 2019 Ben Oliverson. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Individual)
public class Individual: NSManagedObject {

    class func getIndividualWithId(id: Int16) -> Individual?{
        
        guard let individual = EntityInteractor.getEntityWithId(entityName: String(describing: self), entityId: id) as? Individual else {
            return nil
        }
        return individual
    }
    
}
