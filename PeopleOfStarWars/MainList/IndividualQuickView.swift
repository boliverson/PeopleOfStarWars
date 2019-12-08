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
            self.affiliationLabel.text = Affiliation(rawValue: Int(individual.affiliation))?.string
            
            self.affiliationIcon.font = UIFont(name: "FontAwesome", size: 45.0)
            
            switch individual.affiliation {
            case 0:
                self.affiliationIcon.text = "" //Rebelion
            case 1:
                self.affiliationIcon.text = "" //First Order
            case 2:
                self.affiliationIcon.text = "" //Jedi
            case 3:
                self.affiliationIcon.text = "" //Sith
            default:
                self.affiliationIcon.text = "¯\\_(ツ)_/¯"
            }
        } catch {
            print("Error trying to fetch individual")
        }
        
        
    }
}
