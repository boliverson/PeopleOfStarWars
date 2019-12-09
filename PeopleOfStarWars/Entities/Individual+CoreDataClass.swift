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
import UIKit

@objc(Individual)
public class Individual: NSManagedObject {
    
    var individualImageDelegate: IndividualImageResponse?

    class func getIndividualWithId(id: Int16) -> Individual?{
        
        guard let individual = EntityInteractor.getEntityWithId(entityName: String(describing: self), entityId: id) as? Individual else {
            return nil
        }
        return individual
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            self.profilePictureBinary = imageData
            do {
                try self.managedObjectContext!.save()
            } catch{
                print("Unexpected error: \(error).")
            }
            DispatchQueue.main.async {
                self.individualImageDelegate?.imageBinaryReceived(data: imageData)
            }
        }
    }
    
}
