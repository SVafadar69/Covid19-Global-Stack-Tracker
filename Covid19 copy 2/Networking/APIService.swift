//
//  APIService.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-12.
//

import Foundation

final class APIService {
    static let shared = APIService() //instant of API Service
    private init() {}

    private let headers = [
        "X-RapidAPI-Key": "3cbed89fb1msha95b9ee524c91cbp1a2d29jsnb92c2e2c88a5",
        "X-RapidAPI-Host": "covid-19-statistics.p.rapidapi.com"
    ]

    private let baseURlString = "https://covid-19-statistics.p.rapidapi.com/"

    func fetchTotalData(completion: @escaping (Result<TotalData, Error>) -> Void) {

        let totalURLString = baseURlString + "reports/total?date=2020-04-07"

        let url = URL(string: totalURLString)

        guard let url = url else {
            completion(.failure(CovidError.incorrectURL)) //incorrect URL error from enum
            return
        }

        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

            //check if URL exists

        //url goes to API
        request.httpMethod = "GET" //get request
        request.allHTTPHeaderFields = headers //allHTTPHeaderFields = dict containing all httpsheaderfields to make request. passing prev declared header fields from headers var



        let session = URLSession.shared //URL sessions


        let dataTask = session.dataTask(with: request, completionHandler:  { (data, response, error) -> Void in


            if error != nil { //if error does exist
                completion(.failure(CovidError.noDataReceived)) //noDataReceived Error
            } else {
                let decoder = JSONDecoder()
                do {
                    let totalDataObject = try decoder.decode(TotalDataObject.self, from: data!)
                    completion(.success(totalDataObject.data)) //passing totalDataObject.data as return
                } catch let error {
                    completion(.failure(error)) //passing error
                }

//                if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
//                    print(json)
                
                
//              if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
//                  print(json)
//              }

                }
            }
        )

        dataTask.resume() //start URL request
    }
    
    func fetchTotalRegions(completion: @escaping (Result<[Country], Error>) -> Void) {
        
        let decoder = JSONDecoder()
        
        //check if local data is available
        
        if let data = LocalFileManager.shared.fetchLocalCountries() {
            
            do {
                print("returning from local data")
                let allCountries = try decoder.decode(AllRegions.self, from: data)
                completion(.success(allCountries.data))
            } catch let error{
                completion(.failure(error))


            }
            return
        }
        

        let countryURLString = baseURlString + "regions"

        let url = URL(string: countryURLString)

        guard let url = url else {
            completion(.failure(CovidError.incorrectURL)) //incorrect URL error from enum
            return
        }

        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

            //check if URL exists

        //url goes to API
        request.httpMethod = "GET" //get request
        request.allHTTPHeaderFields = headers //allHTTPHeaderFields = dict containing all httpsheaderfields to make request. passing prev declared header fields from headers var



        let session = URLSession.shared //URL sessions


        let dataTask = session.dataTask(with: request, completionHandler:  { (data, response, error) -> Void in


            if error != nil { //if error does exist
                completion(.failure(CovidError.noDataReceived)) //noDataReceived Error
            } else {
                
                
                //savel locally
                
                LocalFileManager.shared.saveCountriesLocally(countryData: data)

        
                do {
                    print("returning from api")
                    let allCountries = try decoder.decode(AllRegions.self, from: data!)
                    completion(.success(allCountries.data))
                } catch let error{
                    completion(.failure(error))


                }
            }
        })

        dataTask.resume() //start URL request
    }
    func fetchReport(for iso: String, completion: @escaping (Result<[RegionReport], Error>) -> Void) {

        let reportsURlString = baseURlString + "reports?iso=\(iso)" //adding vars to string with \()

        let url = URL(string: reportsURlString)

        guard let url = url else {
            completion(.failure(CovidError.incorrectURL)) //incorrect URL error from enum
            return
        }

        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

            //check if URL exists

        //url goes to API
        request.httpMethod = "GET" //get request
        request.allHTTPHeaderFields = headers //allHTTPHeaderFields = dict containing all httpsheaderfields to make request. passing prev declared header fields from headers var


        let session = URLSession.shared //URL sessions


        let dataTask = session.dataTask(with: request, completionHandler:  { (data, response, error) -> Void in


            if error != nil { //if error does exist
                completion(.failure(CovidError.noDataReceived)) //noDataReceived Error
            } else {
                
//                if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
//                                 print(json)
//                             }
//
                let decoder = JSONDecoder()
                let formatter = DateFormatter() //tell Decoder should convert date format to Date obj

                formatter.dateFormat = "y-MM-dd"
                decoder.dateDecodingStrategy = .formatted(formatter)

                do {
                    let allReports = try decoder.decode(AllReports.self, from: data!)
                    completion(.success(allReports.data))
                } catch let error{
                    completion(.failure(error))


                }
            }
        })

        dataTask.resume() //start URL request
    }
}

