//
//  AlertItem.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-14.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    
    let title: Text
    let message: Text //of class Text
    let dismissButton: Alert.Button //alert button
    
    
}

struct AlertContext {
    static let unableToFetch = AlertItem(title: Text("Error - World Total"), message: Text("Server doesn't respond \n Please Try Again. "), dismissButton: .default(Text("OK")))
    
    static let unableCountryStats = AlertItem(title: Text("Error - Country Stats"), message: Text("Unable to receive data from Server \n Please try again later. \n "), dismissButton: .default(Text("OK")))
    
  static let unableToFetchCountries = AlertItem(title: Text("Server Error!"), message: Text("unable woop"), dismissButton: .default(Text("OK"))) //default -> default style
}
