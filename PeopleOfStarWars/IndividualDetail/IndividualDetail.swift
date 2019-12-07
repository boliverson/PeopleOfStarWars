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
    
    @IBOutlet var navigationBar: UINavigationItem!
    @IBOutlet var affiliationIconLabel: UILabel!
    @IBOutlet var individualImage: UIImageView!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var birthdateLabel: UILabel!
    @IBOutlet var affiliationTextLabel: UILabel!
    @IBOutlet var hasForceLabel: UILabel!
    
    
    @IBAction func didSelectDone(_ sender: Any) {
    }
}
