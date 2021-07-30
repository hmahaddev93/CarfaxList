//
//  ContentView.swift
//  CarfaxList
//
//  Created by Khateeb Mahad Hussain on 7/30/21.
//

import SwiftUI

struct VehicleListView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: {
                CarfaxService().fetchSampleListing { result in
                    switch result {
                    case .success(let error):
                        print(error.description)
                    case .failure(let vehicles):
                        print(vehicles)
                    }
                }
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleListView()
    }
}
