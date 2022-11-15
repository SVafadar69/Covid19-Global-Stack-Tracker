//
//  TotalDataView.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-13.
//

import SwiftUI

struct TotalDataView: View { //default vals of view will be used if not specified
    
    var number: String = "--"
    var name : String = "Error"
    var color: Color = .primary
    
    var body: some View {
        
        GeometryReader {
            geometry in
            
            VStack (spacing: 10) {
                Text(self.number)
                    .font(.subheadline)
                    .foregroundColor(self.color) //foreground color = col displayed in View
                Text(self.name)
                    .font(.body)
                    .foregroundColor(self.color) //foreground color = col displayed in View
                
            }.frame(width: geometry.size.width, height: 80, alignment: .center)
                .background(Color("cardBackground"))
                .cornerRadius(8.0) //create rectangular 
            //arranges elements in the center
            //VStack = view that arranges children in vertical line
        }
    }
}

struct TotalDataView_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataView()
    }
}
