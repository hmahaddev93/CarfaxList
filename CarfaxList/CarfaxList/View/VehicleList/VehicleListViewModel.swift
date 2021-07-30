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
    @Published var activeError: Error?
    
    var isPresentingAlert: Binding<Bool> {
        return Binding<Bool>(
            get: {
            return self.activeError != nil
        }, set: { newValue in
            guard !newValue else { return }
            self.activeError = nil
        })
    }
        
    func fetchVehicles() {
        CarfaxService().fetchSampleListing { [unowned self] result in
            switch result {
            
            case .success(let vehicles):
                DispatchQueue.main.async {
                    self.vehicles = vehicles
                    self.activeError = nil
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.activeError = error
                    self.vehicles = []
                }
            }
        }
        
    }
}
