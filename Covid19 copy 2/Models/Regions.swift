//
//  Regions.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-12.
//

import Foundation

struct AllRegions: Codable {
    let data: [Country]
    
}

struct Country: Codable { //Codable = type that can convert itself in and out of representation
    let iso: String
    let name: String
    
    static let dummyData = Country(iso: "N/A", name: "Error")
}
