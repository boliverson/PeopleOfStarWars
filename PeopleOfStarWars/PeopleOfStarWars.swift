//
//  PeopleOfStarWars.swift
//  PeopleOfStarWars
//
//  Created by Ben Oliverson on 12/7/19.
//  Copyright © 2019 Ben Oliverson. All rights reserved.
//

import UIKit

class PeopleOfStarWars: UIViewController {
    
    let downloadIndividuals = DownloadIndividual()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadIndividuals.downloadAction()
    }


}

