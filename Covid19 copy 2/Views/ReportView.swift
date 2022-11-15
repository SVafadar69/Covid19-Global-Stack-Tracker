//
//  ReportView.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-14.
//

import SwiftUI

struct ReportView: View {
    
    var report: RegionReport
    
    var body: some View {
        
        ZStack(alignment: .top) { //view that overlays children
            LinearGradient(colors: [
                Color(red: 0.76, green: 0.15, blue: 0.26), Color(red: 0.01, green: 0.23, blue: 0.5)], startPoint: .topLeading , endPoint: .bottomLeading).ignoresSafeArea() // ignoresSafeArea = full Screen
            
            VStack {
                
                Spacer()
                Spacer()
                
                Spacer()
                Spacer()
                
                Spacer()
                
                Text(report.region.name)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text(report.region.province)
                    .foregroundColor(.white)
                    .font(.title) //type of font

                Spacer()
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Date: \(report.formattedDate)")
                    Text("Confirmed Cases: \(report.confirmed.roundedWithAbbreviations)")
                    Text("Activate Cases: \(report.active)")
                    Text("Deaths: \(report.deaths)")
                    Text("Fatality Rate: \(report.fatality_rate.formatted())%")
                    
                    
                    
                }
                
                .font(.title2)
                .frame(maxWidth: .infinity)
                .padding(50)
                .background(.ultraThickMaterial) //translucent background
                .clipShape(RoundedRectangle(cornerRadius: 20)) //rounding the frame
                .padding()

                Spacer()
                
            }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(report: RegionReport.dummyData)
    }
}
