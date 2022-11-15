//
//  ContentView.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-12.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject private var viewModel = MainViewModel()
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) { //view that overlays children
                LinearGradient(colors: [
                    Color(red: 0.76, green: 0.15, blue: 0.26), Color(red: 0.01, green: 0.23, blue: 0.5)], startPoint: .topLeading , endPoint: .bottomLeading).ignoresSafeArea() // ignoresSafeArea = full Screen
                
                VStack(alignment: .leading) {
                    Text("Total Cases")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(10)
                    
                    TDV(totalData: viewModel.totalData) //passing in total Data from TDV View to the main Stack
                    
                    if viewModel.isSearchVisible {
                    SearchBarView(searchText: $viewModel.searchText
                    )}


                    
                    Text("Countries")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(10)
                    
                    List { //list = container of row of cols that are clickable
                        Section { //section = container view you can add hierarchy to
                            ForEach(viewModel.allCountries.filter {
                                
                                viewModel.searchText.isEmpty ? true : $0.name.lowercased().contains(viewModel.searchText.lowercased()) //if ViewModel.search text is empty, use given names. otherwise filter 
                                
                            }, id: \.iso) //using iso as id since iso is unique
                            { country in
                                NavigationLink(destination: CountryDetailView(viewModel: CountryDetailViewModel(country: country))) { //navigate -> hello
                                    Text(country.name) //-> nav link on each country
                                } //send to navigation view from each country
                                
                            }
                    }
                    } .listStyle(.plain)
                    
                    //view that arranges children in vertical line
                    
                    
            }
            
        }
            .navigationTitle("Covid 19 Statistics") ////adding title to nav view
            
            .alert(item: $viewModel.alertItem, content: {alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            })
            .toolbar {
                Button {
                    print("Countries")
                    viewModel.isSearchVisible = true
                } label: {
                    Image(systemName: "magnifyingglass") //> create an image of a mag glass
                }
            }
            .tint(.white)
        }
        .accentColor(.white)
        
//            .padding()
//            .onAppear {
//                APIService.shared.fetchTotalData {result in
//                switch result {
//                case.success(let totalData):
//                    print("confirmed", totalData.confirmed)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//                APIService.shared.fetchTotalRegions(completion: ) {result in
//                switch result {
//
//                case.success(let AllCountries):
//                    print("count", AllCountries.count)
//
//                case .failure(let error):
//                    print(error.localizedDescription)
//
//                }
//                APIService.shared.fetchReport(for: "USA") {result in
//                switch result {
//
//                case.success(let woop): //woop -> could be any var - to hold objects of Reports file
//                    print("fetchReport", woop.first!.confirmed)
//
//                case .failure(let error):
//                    print(error.localizedDescription)
//
//                }
//            } //onAppear -> action to perform when called
    }
}
//    }
//    }
//
//    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

