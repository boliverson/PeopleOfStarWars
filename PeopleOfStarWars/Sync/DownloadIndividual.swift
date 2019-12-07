//
//  DownloadIndividual.swift
//  PeopleOfStarWars
//
//  Created by Ben Oliverson on 12/7/19.
//  Copyright © 2019 Ben Oliverson. All rights reserved.
//

import Foundation

class DownloadIndividual: DownloadBase {
    
    override func url() -> String {
        return "https://edge.ldscdn.org/mobile/interview/directory"
    }
    
    override func jsonKey() -> String? {
        return "individuals"
    }
    
    override func saveData(item: Dictionary<String,Any>){
        print(item)
    }
}
