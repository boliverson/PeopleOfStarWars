//
//  DownloadIndividual.swift
//  PeopleOfStarWars
//
//  Created by Ben Oliverson on 12/7/19.
//  Copyright © 2019 Ben Oliverson. All rights reserved.
//

import CoreData
import UIKit

class DownloadIndividual: DownloadBase {
    
    override func url() -> String {
        return "https://edge.ldscdn.org/mobile/interview/directory"
    }
    
    override func jsonKey() -> String? {
        return "individuals"
    }
    
    override func saveData(item: Dictionary<String,Any>){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        guard let individualId = item["id"] as? Int16 else {return}
        var individual = Individual.getIndividualWithId(id: individualId)
        
        if individual == nil {
            individual = Individual.init(entity: NSEntityDescription.entity(forEntityName: "Individual", in: context)!, insertInto: context)
            individual?.id = individualId
        }

        individual?.firstName = item["firstName"] as? String
        individual?.lastName = item["lastName"] as? String
        let date = item["birthdate"] as? String
        individual?.birthdate = date?.dateFromStringYearMonthDayNoTime()
        individual?.profilePictureURL = item["profilePicture"] as? String
        individual?.forceSensitive = item["forceSensitive"] as? Bool ?? false
        
        switch item["affiliation"] as! String {
        case "RESISTANCE":
            individual?.affiliation = Int16(Affiliation.RESISTANCE.rawValue)
        case "FIRST_ORDER":
            individual?.affiliation = Int16(Affiliation.FIRST_ORDER.rawValue)
        case "JEDI":
            individual?.affiliation = Int16(Affiliation.JEDI.rawValue)
        case "SITH":
            individual?.affiliation = Int16(Affiliation.SITH.rawValue)
        default:
            individual?.affiliation = Int16(Affiliation.SITH.rawValue)
        }

        do {
            try context.save()
        } catch{
            print("Unexpected error: \(error).")
        }
    }
}
