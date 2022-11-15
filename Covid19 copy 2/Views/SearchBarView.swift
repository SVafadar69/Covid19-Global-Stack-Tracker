//
//  SearchBarView.swift
//  Covid19
//
//  Created by Steven Vafadar on 2022-11-14.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        
        HStack {
            TextField("Country...", text: $searchText)
                .foregroundColor(.white)
                .padding()
        }
        
        .frame(height: 50) //no width declared -> automatically take width of device 
        .background(.regularMaterial) //somewhat translucent background
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant("")) //constant = binding with immutable value.
    }
}
