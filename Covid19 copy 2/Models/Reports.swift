//
//  Reports.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-13.
//

import Foundation

struct AllReports: Codable {
    let data: [RegionReport] //return Array of RegionReport objects
}

struct RegionReport: Codable, Identifiable { //Identifiable to hold the UUID
    let id = UUID()
    let date: Date //"2022-11-12"
    //let last_update : Date //"2022-11-13 04:21:14"
    let confirmed: Int
    let deaths: Int
    let active : Int
    let fatality_rate: Double //0.0079
    let region: RegionDetail //region -> RegionDetail object 
    
    var formattedDate: String {
        date.formatted(date: .abbreviated, time: .omitted)
    }
    
    static let dummyData = RegionReport(date: Date.now, confirmed: 0, deaths: 0, active: 0, fatality_rate: 0, region: RegionDetail(name: "N/A", province: "Province"))
}

struct RegionDetail: Codable {
    
    let name: String
    let province: String
}
