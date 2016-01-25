//
//  Filter.swift
//  Anyway
//
//  Created by Aviel Gross on 14/12/2015.
//  Copyright © 2015 Hasadna. All rights reserved.
//

import Foundation

public class Filter {
    var startDate = NSDate(timeIntervalSince1970: 1356991200) { didSet{ valueChanged() } } // Default: Jan 1st 2013
    var endDate = NSDate() { didSet{ valueChanged() } }  // Default: Now
    var showFatal = true { didSet{ valueChanged() } }
    var showSevere = true { didSet{ valueChanged() } }
    var showLight = true { didSet{ valueChanged() } }
    var showInaccurate = false { didSet{ valueChanged() } }
    var showAccurate = true { didSet{ valueChanged() } }
    
    var description: String {
        let valsAndNames = [
            "Fatal": showFatal,
            "Severe": showSevere,
            "Light": showLight,
            "Inaccurate": showInaccurate,
            "Accurate": showAccurate ]
        return valsAndNames.reduce("") { return "\($0) | \($1.0): \($1.1)" }
    }
    
    var onChange: ()->() = {}
    func valueChanged() { print("filter changed"); onChange() }
}