//
//  CountryDetailViewModel.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-14.
//

import Foundation

final class CountryDetailViewModel: ObservableObject {
    
    @Published var reports: [RegionReport] = [] //empty array of type regionreport objects 
    @Published var alertItem: AlertItem?
    
    private var iso: String
    
    
    init(country: Country) { //inheriting Country object data 
        iso = country.iso //iso = country object's iso
    }
    
    func fetchReport() {
        APIService.shared.fetchReport(for: iso) { result in
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let reports):
                    self.reports = reports //reports break
                    
                case .failure(_):
                    print("Error getting country report.")
                    //TODO: show alert
                }
            }
        }
}
}
