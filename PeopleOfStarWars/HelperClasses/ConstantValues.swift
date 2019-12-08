//
//  ConstantValues.swift
//  PeopleOfStarWars
//
//  Created by Ben Oliverson on 12/7/19.
//  Copyright © 2019 Ben Oliverson. All rights reserved.
//

import Foundation

enum Affiliation : Int {
    case RESISTANCE
    case FIRST_ORDER
    case JEDI
    case SITH
    
    static let affilitationMap: [Affiliation: String] = [
        .RESISTANCE:"Resistance",
        .FIRST_ORDER:"First Order",
        .JEDI:"Jedi",
        .SITH:"Sith"
    ]
    
    var string: String{
        return Affiliation.affilitationMap[self]!
    }
}
