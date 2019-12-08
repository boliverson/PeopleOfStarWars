//
//  Extensions.swift
//  PeopleOfStarWars
//
//  Created by Ben Oliverson on 12/7/19.
//  Copyright © 2019 Ben Oliverson. All rights reserved.
//

import Foundation

extension String{
    
    func dateFromStringYearMonthDayNoTime() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: self) else {return nil}
        return date
    }
}

extension Date{
    
    func formatDateForUI() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d, yyyy"
        let date = formatter.string(from: self)
        return date
    }
}
