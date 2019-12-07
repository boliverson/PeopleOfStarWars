//
//  IndividualQuickView.swift
//  PeopleOfStarWars
//
//  Created by Ben Oliverson on 12/7/19.
//  Copyright © 2019 Ben Oliverson. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class IndividualQuickView: UITableViewCell {
    @IBOutlet var individualImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var affiliationLabel: UILabel!
    @IBOutlet var affiliationIcon: UILabel!
    
    func setUpCell(individualId: NSManagedObjectID){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            let individual = try context.existingObject(with: individualId) as! Individual
            self.nameLabel.text = "\(individual.firstName ?? "Ben") \(individual.lastName ?? "Oliverson")"
        } catch {
            print("Error trying to fetch individual")
        }
        
        
    }
}
