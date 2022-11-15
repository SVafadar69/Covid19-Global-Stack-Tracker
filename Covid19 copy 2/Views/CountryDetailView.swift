//
//  CountryDetailView.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-14.
//

import SwiftUI

struct CountryDetailView: View {
    
    @ObservedObject var viewModel: CountryDetailViewModel //ObservedObj -> invalidates view when observable object changes. Viewmodel = CDV type
    
    var body: some View {
        VStack {
            if viewModel.reports.count > 1 {
                //show list of states
                List {
                    ForEach(viewModel.reports) {
                        report in
                        NavigationLink(destination:ReportView( report: report)) {
                        Text(report.region.province)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle(viewModel.reports.first?.region.name ?? "Unknown Country") //show region name, else unknown country
                .navigationBarTitleDisplayMode(.inline) //tiitle within bound of nav bar
            } else {
                ReportView(report: viewModel.reports.first ?? RegionReport.dummyData)
                    .ignoresSafeArea() //expands view out of its safe area
                
                
            }
        }
        .alert(item: $viewModel.alertItem, content: {
            alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .onAppear {
            if viewModel.reports.count == 0 {
                viewModel.fetchReport()
            }//if reports have not fetched data
        }
        
        }
        
    }


struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(viewModel: CountryDetailViewModel(country: Country.dummyData)) //pass dummy data to preview
    }
}
