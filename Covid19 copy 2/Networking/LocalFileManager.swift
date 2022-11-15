//
//  LocalFileManager.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-14.
//

import Foundation

final class LocalFileManager {
    static let shared = LocalFileManager()
    
    private init() {}
    
    func saveCountriesLocally(countryData: Data?)  {
        
        if let countryData = countryData {
            if let json = try? JSONSerialization.jsonObject(with: countryData, options: []) as? [String: Any] {
                
                do {
                    let fileUrl = getDocumentDirectory().appendingPathComponent("country.json")
                    
                    try JSONSerialization.data(withJSONObject: json).write(to: fileUrl) //try writing the json data to new file country.json
                } catch {
                    print(error.localizedDescription)
                }
                
            }
        }
    }
    
    func fetchLocalCountries() -> Data? {
        do {
            let fileUrl = getDocumentDirectory().appendingPathComponent("country.json")
            
            let data = try Data(contentsOf: fileUrl)
            return data
            
        } catch {
            print(error.localizedDescription)
            return nil
            
            }
        }
    
    
    private func getDocumentDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
}
