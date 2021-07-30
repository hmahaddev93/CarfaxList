//
//  ContentView.swift
//  CarfaxList
//
//  Created by Khateeb Mahad Hussain on 7/30/21.
//

import SwiftUI

struct VehicleListView: View {
    
    @ObservedObject var viewModel:VehicleListViewModel = VehicleListViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(viewModel.vehicles, id: \.id) { vehicle in
                   VehicleRowView(vehicle: vehicle)
                }
            }
            .padding(.top, 16)
        }
        .onAppear {
            viewModel.fetchVehicles()
        }
        .alert(isPresented: viewModel.isPresentingAlert, content: {
            Alert(title: Text("Error"),
                  message: Text(viewModel.activeError!.localizedDescription),
                  dismissButton: .cancel())
        })
        .background(Color.white95)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleListView()
    }
}
