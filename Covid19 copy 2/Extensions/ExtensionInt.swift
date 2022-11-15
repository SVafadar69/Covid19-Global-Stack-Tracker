//
//  ExtensionInt.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-14.
//

import Foundation

extension Int {
    func formatNumber () -> String {
        let formatter = NumberFormatter() //convert from ints 
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))! //force unwrap = sure it can conver to string
}
    var roundedWithAbbreviations: String {
        let number = Double(self)
        let million = number / 1_000_000
        
        if million >= 1.0 {
            return "\(round(million * 10)/10)M" //if num > M
        } else {
            return "\(self.formatNumber())" //if not, num converted to string
            
        }
    }
}
