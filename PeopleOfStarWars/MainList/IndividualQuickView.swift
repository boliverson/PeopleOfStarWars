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

class IndividualQuickView: UITableViewCell, IndividualImageResponse {
    @IBOutlet var individualImage: UIImageView!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var affiliationLabel: UILabel!
    @IBOutlet var affiliationIcon: UILabel!
    @IBOutlet var activityindicator: UIActivityIndicatorView!
    
    func setUpCell(individualId: NSManagedObjectID){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            let individual = try context.existingObject(with: individualId) as! Individual
            
            individual.individualImageDelegate = self
            
            self.firstNameLabel.text = individual.firstName
            self.lastNameLabel.text = individual.lastName
            self.affiliationLabel.text = Affiliation(rawValue: Int(individual.affiliation))?.string
            
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
            
//            self.affiliationIcon.font = UIFont(name: "FontAwesome5ProFree", size: 45.0)
            
            if individual.profilePictureBinary == nil && individual.profilePictureURL != nil{
                self.startActivityIndicator(ai: activityindicator)
                individual.setImage(from: individual.profilePictureURL!)
            } else {
                setCellImage(data: individual.profilePictureBinary!)
            }
            
        } catch {
            print("Error trying to fetch individual")
        }
    }
    
    func imageBinaryReceived(data: Data){
        setCellImage(data: data)
    }
    
    func setCellImage(data: Data) {
        DispatchQueue.global().async {
            guard var image = UIImage(data: data, scale: 50.0) else {return}
            let aspectHeight = 130 / image.size.height
            let aspectWidth = 130 / image.size.width
            image = self.resizedImage(image: image, size: CGSize(width: image.size.width * aspectWidth, height: image.size.height * aspectHeight))!
            DispatchQueue.main.async {
                self.stopActivityIndicator(ai: self.activityindicator)
                self.individualImage.image = image
            }
        }
    }
    
    func resizedImage(image: UIImage, size: CGSize) -> UIImage? {

        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
