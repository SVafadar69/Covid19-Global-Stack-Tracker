//
//  TDV.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-13.
//

import SwiftUI

struct TDV: View {
    var totalData: TotalData
    
    
    var body: some View {
        
        VStack {
            HStack {
                TotalDataView(number: totalData.confirmed.formatNumber(), name: "Confirmed", color: .red)
                TotalDataView(number: totalData.active.formatNumber(),	 color: .red) //passing data from TotalData struct.
            } //create 2 horizontal stack objs within the vertical stack
            
            HStack {
                TotalDataView(number:  String(totalData.deaths), name: "Deaths", color: .red)
                TotalDataView(number: String(format: "%.2f", totalData.fatality_rate), name: "Death %", color: .red) //converting deaths to 2 decimals
                
            }
           
}
        .frame(height: (170))
        .padding(10)
    }
}

struct TDV_Previews: PreviewProvider {
    static var previews: some View {
        TDV(totalData: TotalData.dummyData)
    }
    
}
