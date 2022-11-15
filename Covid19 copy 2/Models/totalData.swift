//
//  totalData.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-12.
//

import Foundation

struct TotalDataObject: Codable {
    let data: TotalData //data of type TotalData
}

struct TotalData: Codable { //let vars -> keys of JSON API data
    let confirmed: Int
    let deaths: Int
    let active: Int
    let fatality_rate: Double
    
    static let dummyData = TotalData(confirmed: 0, deaths: 0, active: 0, fatality_rate: 0)
}
