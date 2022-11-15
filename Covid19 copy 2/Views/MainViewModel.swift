//
//  MainViewModel.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-13.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var totalData = TotalData.dummyData //storage of dummy data from TotalData
    @Published var allCountries: [Country] = [] //empty array of COuntry objects
    @Published var searchText = ""
    @Published var isSearchVisible = false //if
    @Published var alertItem: AlertItem?
    
    
    init() //init class
    {
        fetchTotalData()
        fetchAllCountries()
        
    }
    
    func fetchTotalData() {
        APIService.shared.fetchTotalData {
            result in
            DispatchQueue.main.async {
                
             //run task async
                switch result {
                case .success (let allData):
                    self.totalData = allData
                case .failure(_):
                        //TODO: create alter item
                    self.alertItem = AlertContext.unableToFetch
                }
            }
        }
    }
    
    func fetchAllCountries() {
        APIService.shared.fetchTotalRegions {
            result in
            DispatchQueue.main.async { //run task async since refreshing data
                
             
                switch result {
                case .success (let allCountries):
                    self.allCountries = allCountries.sorted(by: {$0.name < $1.name}) //take every item, check if name is before 2nd item. -> sort automatically 
                case .failure(_):
                    self.alertItem = AlertContext.unableToFetchCountries
                        //TODO: create alter item
                }
            }
        }
    }
}
