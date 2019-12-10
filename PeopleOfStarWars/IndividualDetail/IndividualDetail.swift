//
//  IndividualDetail.swift
//  PeopleOfStarWars
//
//  Created by Ben Oliverson on 12/7/19.
//  Copyright © 2019 Ben Oliverson. All rights reserved.
//

import Foundation
import UIKit

class IndividualDetail: UIViewController {
    
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var affiliationIconLabel: UILabel!
    @IBOutlet var individualImage: UIImageView!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var birthdateLabel: UILabel!
    @IBOutlet var affiliationTextLabel: UILabel!
    @IBOutlet var hasForceLabel: UILabel!
    var selectedIndividual: Individual!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpUI()
    }
    
    func setUpUI() {
//        navBar = "\(selectedIndividual.firstName ?? "Ben's")'s Bio"
        firstNameLabel.text = selectedIndividual.firstName
        lastNameLabel.text = selectedIndividual.lastName
        birthdateLabel.text = selectedIndividual.birthdate?.formatDateForUI()
        let affiliation : Int = Int(selectedIndividual.affiliation)
        affiliationTextLabel.text = Affiliation(rawValue:affiliation)?.string
        hasForceLabel.text = selectedIndividual.forceSensitive ? "The Force is strong with this one" : "The Force does not reside here"
        individualImage.image = UIImage(data: selectedIndividual.profilePictureBinary!)
    }
    
    @IBAction func didSelectDone(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
