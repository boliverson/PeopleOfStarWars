//
//  Individual+CoreDataProperties.swift
//  PeopleOfStarWars
//
//  Created by Ben Oliverson on 12/7/19.
//  Copyright © 2019 Ben Oliverson. All rights reserved.
//
//

import Foundation
import CoreData


extension Individual {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Individual> {
        return NSFetchRequest<Individual>(entityName: "Individual")
    }

    @NSManaged public var id: Int16
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var birthdate: Date?
    @NSManaged public var profilePictureURL: String?
    @NSManaged public var profilePictureBinary: Data?
    @NSManaged public var forceSensitive: Bool
    @NSManaged public var affiliation: Int16

}
