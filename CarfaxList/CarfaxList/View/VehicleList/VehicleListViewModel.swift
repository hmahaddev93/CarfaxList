//
//  VehicleListViewModel.swift
//  CarfaxList
//
//  Created by Khatib H. on 7/30/21.
//

import SwiftUI
import Combine

class VehicleListViewModel: ObservableObject {
    @Published var vehicles:[Vehicle] = [Vehicle]()
        
    func fetchVehicles() {
        CarfaxService().fetchSampleListing { [unowned self] result in
            switch result {
            
            case .success(let vehicles):
                print(vehicles)
                DispatchQueue.main.async {
                    self.vehicles = vehicles
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
